import 'package:flutter/material.dart';

extension DarkThemeX on ThemeData {
  bool get isDark => brightness == Brightness.dark;
}
