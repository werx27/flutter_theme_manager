import 'package:flutter/material.dart';

class ColorManager {
  static ColorScheme getColorList(bool isDark) {
    if (isDark) {
      return dark;
    } else {
      return light;
    }
  }

  static ColorScheme light = const ColorScheme.light().copyWith(
    primary: Colors.blue,
    secondary: Colors.teal,
  );

  static ColorScheme dark = const ColorScheme.dark().copyWith(
    primary: Colors.red.shade300,
    secondary: Colors.orange,
  );
}
