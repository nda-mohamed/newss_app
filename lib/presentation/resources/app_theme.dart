import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.white,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.black,
    brightness: Brightness.dark,
  );

}