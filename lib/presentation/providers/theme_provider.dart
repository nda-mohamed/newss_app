import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  get getThemeMode => _themeMode;

  set setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  bool get isDarkMode => (_themeMode == ThemeMode.dark);
}
