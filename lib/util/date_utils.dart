import 'package:intl/intl.dart';

class DateUtils {
  static String format(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static int parse(String dateStr) {
    var dateTime = DateTime.parse(dateStr);
    return dateTime.microsecond;
  }
}
