import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_palette.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/app_theme.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/app_default_values.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/functs.dart';

ThemeModel getDefaultAppTheme() {
  return const ThemeModel(mode: ThemeMode.light);
}

/// returns the platform [ThemeMode];
/// if 'follow system theme' is false then null is returned
/// if [context] is null then use [SchedulerBinding]
ThemeMode? getPlatformThemeMode(BuildContext? context) {
  if (!AppDefaultValues.FOLLOW_SYSTEM_THEME) {
    return null;
  }

  Brightness brightness;

  if (isNotNull(context)) {
    brightness = MediaQuery.of(context!).platformBrightness;
  } else {
    brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }

  return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}

/// returns true if dark theme mode is activated (by the user or by the platform)
bool isDarkMode(BuildContext context) {
  final platformTheme = getPlatformThemeMode(context);

  if (isNotNull(platformTheme)) {
    return platformTheme == ThemeMode.dark;
  }

  return Theme.of(context).brightness == Brightness.dark;
}

/// Get app theme [AppTheme]
AppTheme getAppTheme(ThemeMode? mode) {
  if (mode == ThemeMode.light) {
    // declared in [lib/common/di/app_theme_di.dart]
    final lightTheme = getIt.get<AppTheme>(instanceName: 'lightTheme');

    return lightTheme;
  }

  // declared in [lib/common/di/app_theme_di.dart]
  final darkTheme = getIt.get<AppTheme>(instanceName: 'darkTheme');

  return darkTheme;
}

/// Returns [ThemeData] from [ThemeData]
ThemeData getAppThemeData(ThemeMode mode) {
  final themeMode = mode;

  // todo uncomment this section to pick the theme from the OS
  // final _platformThemeMode = getPlatformThemeMode(null);
  //
  // /// if [platformThemeMode] is not null then follow that
  // if (isNotNull(_platformThemeMode)) {
  //   _themeMode = _platformThemeMode!;
  // }

  return getAppTheme(themeMode).themeData;
}

/// Returns [ThemePalette] from [ThemeData]
ThemePalette getPalette(BuildContext context) {
  final mode = isDarkMode(context) ? ThemeMode.dark : ThemeMode.light;

  return getAppTheme(mode).palette;
}
