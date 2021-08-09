import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';

final rootRouter = RootRouter(
  routerAuthGuard: RouterAuthGuard(),
);
