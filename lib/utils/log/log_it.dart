import 'package:flutter_mobx_dio_boilerplate/constants/env.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class LogIt {
  final Logger logger;

  LogIt(this.logger);

  /// Log a message at level [Level.trace].
  void trace(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void fatal(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
