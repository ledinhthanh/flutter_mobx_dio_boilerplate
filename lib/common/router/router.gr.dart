// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/pages/home.dart'
    as _i1;
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/pages/login.dart'
    as _i2;
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/pages/page_not_found.dart'
    as _i3;
import 'package:flutter_mobx_dio_boilerplate/features/profile/ui/pages/profile.dart'
    as _i4;
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/pages/splash.dart'
    as _i5;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    String? dummyValue,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            dummyValue: dummyValue,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i1.HomeScreen(
        key: args.key,
        dummyValue: args.dummyValue,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.dummyValue,
  });

  final _i7.Key? key;

  final String? dummyValue;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, dummyValue: $dummyValue}';
  }
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    required _i6.PageRouteInfo<dynamic>? redirectOnLogin,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            redirectOnLogin: redirectOnLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i2.LoginScreen(
        key: args.key,
        redirectOnLogin: args.redirectOnLogin,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.redirectOnLogin,
  });

  final _i7.Key? key;

  final _i6.PageRouteInfo<dynamic>? redirectOnLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, redirectOnLogin: $redirectOnLogin}';
  }
}

/// generated route for
/// [_i3.PageNotFoundScreen]
class PageNotFoundRoute extends _i6.PageRouteInfo<PageNotFoundRouteArgs> {
  PageNotFoundRoute({
    required String routeName,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PageNotFoundRoute.name,
          args: PageNotFoundRouteArgs(routeName: routeName),
          initialChildren: children,
        );

  static const String name = 'PageNotFoundRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PageNotFoundRouteArgs>();
      return _i3.PageNotFoundScreen(args.routeName);
    },
  );
}

class PageNotFoundRouteArgs {
  const PageNotFoundRouteArgs({required this.routeName});

  final String routeName;

  @override
  String toString() {
    return 'PageNotFoundRouteArgs{routeName: $routeName}';
  }
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
