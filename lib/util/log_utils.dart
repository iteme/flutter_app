import 'package:logging/logging.dart';

class LogUtils {
  static final _log = Logger('app');

  static void init() {
    Logger.root.level = Level.FINE; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.fine(message, error, stackTrace);
  }

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.info(message, error, stackTrace);
  }

  static void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.warning(message, error, stackTrace);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.shout(message, error, stackTrace);
  }
}
