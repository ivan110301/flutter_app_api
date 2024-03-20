import 'package:logger/logger.dart';

class Logs {
  Logs._();
  final Logger _logger = Logger();

  static Logs _instance = Logs._();
  static Logger get p => _instance._logger;
}
