import 'package:dio/dio.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_errors/bad_network_api_error.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/network/network_info.dart';

class BadNetworkErrorInterceptor extends Interceptor {
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return options;
  }

  @override
  Future onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response == null && !await _networkInfo.isConnected) {
      return BadNetworkApiError(dioError: error);
    }

    return null;
  }
}
