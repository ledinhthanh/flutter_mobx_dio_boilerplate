import 'package:flutter_mobx_dio_boilerplate/common/router/router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouterDi {
  @lazySingleton
  RootRouter get rootRouter => RootRouter();
}
