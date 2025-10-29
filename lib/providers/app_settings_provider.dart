import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  bool isDarkMode = false;
  String selectedLanguage = "English";

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
  }
}
