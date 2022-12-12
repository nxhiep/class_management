import 'package:intl/intl.dart';

class Utils {

  static final _dateFormat = DateFormat.yMd();

  static String formatDate(dynamic date) {
    if(date is DateTime) {
      return _dateFormat.format(date);
    } else if(date is int) {
      return _dateFormat.format(DateTime(date));
    } else if(date is String) {
      return _dateFormat.format(DateTime.parse(date));
    }
    return date?.toString() ?? "";
  }
}