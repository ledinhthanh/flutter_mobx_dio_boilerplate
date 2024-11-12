import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/navigation_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/strings.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/widgets/splash_loading.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/store_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/widget_extends/sf_widget.dart';
import 'package:mobx/mobx.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends SfWidget<SplashScreen> {
  LoginStore get _loginStore => getIt<LoginStore>();

  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction(
        (_) => _loginStore.isLoggedIn,
        (bool? isLoggedIn) {
          if (getCurrentScreen(context) != SplashRoute.name) {
            return;
          }

          handleIsLoggedIn(isLoggedIn: isLoggedIn);
        },
      ),
    ];
    super.initState();
  }

  @override
  Future<void> onInitApp() async {
    await _loginStore.getAuthentication(context);

    return super.onInitApp();
  }

  void handleIsLoggedIn({bool? isLoggedIn}) {
    navigateToHomeScreen(routeArgs: null);
  }

  Widget buildFirstScreen(BuildContext context) {
    return const SplashLoading(
      title: Strings.APP_NAME,
    );
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFirstScreen(context),
    );
  }
}
