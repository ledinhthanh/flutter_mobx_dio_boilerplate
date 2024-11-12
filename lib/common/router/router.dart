import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';

@AutoRouterConfig()
class RootRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    // splash
    AutoRoute(
      initial: true,
      path: '/splashScreen',
      page: SplashRoute.page,
    ),

    // home
    AutoRoute(
      path: '/homeScreen',
      page: HomeRoute.page,
    ),

    // login
    AutoRoute(
      path: '/loginScreen',
      page: LoginRoute.page,
    ),

    // login
    AutoRoute(
      path: '/profileScreen',
      page: ProfileRoute.page,
      guards: [RouterAuthGuard()],
    ),

    AutoRoute(
      path: '*',
      page: PageNotFoundRoute.page,
    ),
  ];
}
