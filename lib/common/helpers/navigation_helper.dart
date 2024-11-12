import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';

bool? isCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.isCurrent;
}

String? getCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.settings.name;
}

Future navigateToRoute({
  BuildContext? context,
  required PageRouteInfo route,
  bool? skipSameRouteCheck,
}) async {
  final skipSameRouteCheck0 = skipSameRouteCheck ?? true;

  if (!skipSameRouteCheck0 && getCurrentScreen(context) == route.routeName) {
    return null;
  }

  if (route.routeName == HomeRoute.name) {
    var routeArgs = const HomeRouteArgs();

    if (route.args is HomeRouteArgs) {
      routeArgs = route.args as HomeRouteArgs;
    }

    return navigateToHomeScreen(routeArgs: routeArgs);
  }

  return getIt<RootRouter>().push(route);
}

Future navigateToRouteAndReplace(
  PageRouteInfo route,
) async {
  if (route.routeName == HomeRoute.name) {
    var routeArgs = const HomeRouteArgs();

    if (route.args is HomeRouteArgs) {
      routeArgs = route.args as HomeRouteArgs;
    }

    return navigateToHomeScreen(routeArgs: routeArgs);
  }

  return getIt<RootRouter>().replace(route);
}

Future navigateToRouteAndRemoveUntil(
  PageRouteInfo route,
) async {
  return getIt<RootRouter>().replaceAll([route]);
}

Future<bool> popCurrentRoute<T extends Object>({T? result}) async {
  return getIt<RootRouter>().maybePop<T>(result);
}

bool canPopCurrentRoute<T>() {
  return getIt<RootRouter>().canPop();
}

/// navigating to homescreen should clear the navigation stack and start again
Future navigateToHomeScreen({
  HomeRouteArgs? routeArgs,
}) async {
  return navigateToRouteAndRemoveUntil(
    HomeRoute(
      dummyValue: routeArgs?.dummyValue,
    ),
  );
}

void navigateToLoginScreen({
  BuildContext? context,
  LoginRouteArgs? args,
}) {
  navigateToRoute(
    context: context,
    route: LoginRoute(redirectOnLogin: args?.redirectOnLogin),
  );
}
