.PHONY: all run_dev_mobile run_unit clean upgrade lint format help watch gen run_prd_mobile build_apk_dev build_apk_stg build_apk_prd purge 

all: lint format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done
run_unit: ## Runs unit tests
	@echo "╠ Running the tests"
	@fvm flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@fvm flutter clean
	@fvm flutter pub get

watch: ## Watches the files for changes
	@echo "╠ Watching the project..."
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

gen: ## Generates the assets
	@echo "╠ Generating the assets..."
	@fvm flutter packages pub run build_runner build --delete-conflicting-outputs

get:
	@fvm flutter pub get

outdate: 
	@fvm flutter pub outdated

pod_update: 
	@cd ./ios && rm -rf Pods/ Podfile.lock ; pod install
	# @cd ./ios && pod update
	# @cd ./ios && pod install --repo-update

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@fvm flutter pub run import_sorter:main
	@fvm flutter format lib

fix:
	@echo "╠ dart fix"
	@dart fix --apply

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

upgrade: clean ## Upgrades dependencies
	@echo "╠ Upgrading dependencies..."
	@fvm flutter pub upgrade --major-versions

commit: format lint run_unit
	@echo "╠ Committing..."
	git add .
	git commit

run_dev_web: ## Runs the web application in dev
	@echo "╠ Running the app"
	@fvm flutter run -d chrome --dart-define=ENVIRONMENT=dev

run_dev: ## Runs the mobile application in dev
	@echo "╠ Running the app"
	@fvm flutter run --flavor development -t lib/main_dev.dart

run_production: ## Runs the mobile application in dev
	@echo "╠ Running the app production"
	@fvm flutter run --flavor production -t lib/main.dart

build_ios_dev: ## Runs the mobile application in dev
	@echo "╠ build the ios development"
	@fvm flutter build ios --debug --no-codesign --simulator

build_apk_dev: ## Runs the mobile application in dev
	@echo "╠ build the apk development"
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter build apk --flavor development -t lib/main_dev.dart

build_apk:
	@echo "╠ build the apk production"
	@fvm flutter build apk --no-shrink

build_apk_appbundle:
	@echo "╠ build the apk production"
	@fvm flutter build appbundle --no-shrink

build_apk_production: ## Runs the mobile application in prod
	@echo "╠ build the apk production"
	@fvm flutter build apk --release

purge: ## Purges the Flutter 
	@pod deintegrate
	@fvm flutter clean
	@fvm flutter pub get

grade: ##grades the Flutter
	@echo "╠ build gradle"
	@cd ./android && ./gradlew wrapper --gradle-version=7.6.1

# Firebase
flutterfire:
	@echo "╠ Configure your apps to use Firebase"
	@flutterfire configure

kill_xcode:
	@echo "╠ xcode kill concurrent builds"
	kill $(ps aux | grep 'xcodebuild' | awk '{print $2}')