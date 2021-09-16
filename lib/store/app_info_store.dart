import 'package:flutter/foundation.dart';

class AppInfoStore with ChangeNotifier {
  String _locale = 'auto';

  String get locale => _locale;

  set locale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
