// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStoreBase, Store {
  Computed<bool>? _$isAppSettingsLoadedComputed;

  @override
  bool get isAppSettingsLoaded => (_$isAppSettingsLoadedComputed ??=
          Computed<bool>(() => super.isAppSettingsLoaded,
              name: '_AppStoreBase.isAppSettingsLoaded'))
      .value;

  late final _$languageAtom =
      Atom(name: '_AppStoreBase.language', context: context);

  @override
  LanguageModel? get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(LanguageModel? value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$themeAtom = Atom(name: '_AppStoreBase.theme', context: context);

  @override
  ThemeModel? get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeModel? value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$setAppLanguageAsyncAction =
      AsyncAction('_AppStoreBase.setAppLanguage', context: context);

  @override
  Future<void> setAppLanguage(
      BuildContext context, LanguageModel languageData) {
    return _$setAppLanguageAsyncAction
        .run(() => super.setAppLanguage(context, languageData));
  }

  late final _$getAppLanguageAsyncAction =
      AsyncAction('_AppStoreBase.getAppLanguage', context: context);

  @override
  Future<void> getAppLanguage() {
    return _$getAppLanguageAsyncAction.run(() => super.getAppLanguage());
  }

  late final _$setAppThemeAsyncAction =
      AsyncAction('_AppStoreBase.setAppTheme', context: context);

  @override
  Future<void> setAppTheme(BuildContext context, ThemeModel data) {
    return _$setAppThemeAsyncAction.run(() => super.setAppTheme(context, data));
  }

  late final _$getAppThemeAsyncAction =
      AsyncAction('_AppStoreBase.getAppTheme', context: context);

  @override
  Future<void> getAppTheme() {
    return _$getAppThemeAsyncAction.run(() => super.getAppTheme());
  }

  @override
  String toString() {
    return '''
language: ${language},
theme: ${theme},
isAppSettingsLoaded: ${isAppSettingsLoaded}
    ''';
  }
}
