// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_connection_checker/data_connection_checker.dart' as _i599;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_client.dart'
    as _i171;
import 'package:flutter_mobx_dio_boilerplate/common/di/app_theme_di.dart'
    as _i708;
import 'package:flutter_mobx_dio_boilerplate/common/di/dio_di.dart' as _i195;
import 'package:flutter_mobx_dio_boilerplate/common/di/logger_di.dart' as _i884;
import 'package:flutter_mobx_dio_boilerplate/common/di/network_info_di.dart'
    as _i684;
import 'package:flutter_mobx_dio_boilerplate/common/di/shared_preferences_di.dart'
    as _i861;
import 'package:flutter_mobx_dio_boilerplate/common/helpers/flushbar_helper.dart'
    as _i361;
import 'package:flutter_mobx_dio_boilerplate/common/network/network_info.dart'
    as _i102;
import 'package:flutter_mobx_dio_boilerplate/common/router/router.dart'
    as _i590;
import 'package:flutter_mobx_dio_boilerplate/common/router/router_di.dart'
    as _i873;
import 'package:flutter_mobx_dio_boilerplate/common/themes/app_theme.dart'
    as _i463;
import 'package:flutter_mobx_dio_boilerplate/constants/env.dart' as _i497;
import 'package:flutter_mobx_dio_boilerplate/features/app/data/controllers/app_controller.dart'
    as _i56;
import 'package:flutter_mobx_dio_boilerplate/features/app/data/data_sources/app_local_data_source.dart'
    as _i621;
import 'package:flutter_mobx_dio_boilerplate/features/app/data/repositories/app_repository.dart'
    as _i876;
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/store/app_store.dart'
    as _i902;
import 'package:flutter_mobx_dio_boilerplate/features/login/data/controllers/login_controller.dart'
    as _i257;
import 'package:flutter_mobx_dio_boilerplate/features/login/data/data_sources/login_local_data_source.dart'
    as _i654;
import 'package:flutter_mobx_dio_boilerplate/features/login/data/data_sources/login_remote_data_source.dart'
    as _i29;
import 'package:flutter_mobx_dio_boilerplate/features/login/data/repositories/login_repository.dart'
    as _i751;
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart'
    as _i437;
import 'package:flutter_mobx_dio_boilerplate/services/analytics_service.dart'
    as _i587;
import 'package:flutter_mobx_dio_boilerplate/services/crashes_service.dart'
    as _i947;
import 'package:flutter_mobx_dio_boilerplate/services/pushes_service.dart'
    as _i308;
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart' as _i483;
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_helper.dart'
    as _i248;
import 'package:flutter_mobx_dio_boilerplate/utils/log/log_it.dart' as _i14;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesDi = _$SharedPreferencesDi();
    final loggerDi = _$LoggerDi();
    final dioDi = _$DioDi();
    final networkInfoDi = _$NetworkInfoDi();
    final routerDi = _$RouterDi();
    final appThemeDi = _$AppThemeDi();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesDi.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i497.Env>(() => _i497.Env());
    gh.lazySingleton<_i974.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i361.Dio>(() => dioDi.dio);
    gh.lazySingleton<_i599.DataConnectionChecker>(
        () => networkInfoDi.dataConnectionChecker);
    gh.lazySingleton<_i361.FlushbarHelper>(() => _i361.FlushbarHelper());
    gh.lazySingleton<_i590.RootRouter>(() => routerDi.rootRouter);
    gh.lazySingleton<_i587.AnalyticsService>(() => _i587.AnalyticsService());
    gh.lazySingleton<_i947.CrashesService>(() => _i947.CrashesService());
    gh.lazySingleton<_i308.PushesService>(() => _i308.PushesService());
    gh.lazySingleton<_i14.LogIt>(() => _i14.LogIt(gh<_i974.Logger>()));
    gh.lazySingleton<_i463.AppTheme>(
      () => appThemeDi.darkTheme,
      instanceName: 'darkTheme',
    );
    gh.lazySingleton<_i171.ApiClient>(() => _i171.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i29.LoginRemoteDataSource>(
        () => _i29.LoginRemoteDataSource(gh<_i171.ApiClient>()));
    gh.lazySingleton<_i463.AppTheme>(
      () => appThemeDi.lightTheme,
      instanceName: 'lightTheme',
    );
    gh.lazySingleton<_i621.AppLocalDataSource>(
        () => _i621.AppLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i248.AlertsHelper>(
        () => _i248.AlertsHelper(gh<_i947.CrashesService>()));
    gh.lazySingleton<_i654.LoginLocalDataSource>(
        () => _i654.LoginLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i876.AppRepository>(
        () => _i876.AppRepository(gh<_i621.AppLocalDataSource>()));
    gh.lazySingleton<_i102.NetworkInfo>(
        () => _i102.NetworkInfo(gh<_i599.DataConnectionChecker>()));
    gh.lazySingleton<_i483.Alerts>(() => _i483.Alerts(
          gh<_i248.AlertsHelper>(),
          gh<_i361.FlushbarHelper>(),
        ));
    gh.lazySingleton<_i751.LoginRepository>(() => _i751.LoginRepository(
          gh<_i654.LoginLocalDataSource>(),
          gh<_i29.LoginRemoteDataSource>(),
          gh<_i102.NetworkInfo>(),
        ));
    gh.lazySingleton<_i56.AppController>(
        () => _i56.AppController(gh<_i876.AppRepository>()));
    gh.lazySingleton<_i257.LoginController>(
        () => _i257.LoginController(gh<_i751.LoginRepository>()));
    gh.lazySingleton<_i902.AppStore>(() => _i902.AppStore(
          gh<_i56.AppController>(),
          gh<_i483.Alerts>(),
        ));
    gh.lazySingleton<_i437.LoginStore>(() => _i437.LoginStore(
          gh<_i257.LoginController>(),
          gh<_i483.Alerts>(),
        ));
    return this;
  }
}

class _$SharedPreferencesDi extends _i861.SharedPreferencesDi {}

class _$LoggerDi extends _i884.LoggerDi {}

class _$DioDi extends _i195.DioDi {}

class _$NetworkInfoDi extends _i684.NetworkInfoDi {}

class _$RouterDi extends _i873.RouterDi {}

class _$AppThemeDi extends _i708.AppThemeDi {}
