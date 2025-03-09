import 'package:flutter/material.dart';

class localprovider extends ChangeNotifier {
  String _locale = "ar"; // اللغة الافتراضية

  String get locale => _locale;

  void changeLanguage(String languageCode) {
    _locale = languageCode;
    notifyListeners(); // تحديث كل الواجهات التي تستمع لهذا المزود
  }
}
