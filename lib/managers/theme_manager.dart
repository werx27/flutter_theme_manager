import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

class ThemeManager {
  static ThemeData getTheme(bool isDark) {
    final theme = isDark ? ThemeData.dark() : ThemeData.light();
    final colorScheme =
        isDark ? const ColorScheme.dark() : const ColorScheme.light();
    final colors = ColorManager.getColorList(isDark);

    return theme.copyWith(
      appBarTheme: _getAppBarTheme(isDark, colors),
      bottomNavigationBarTheme: _getBottomNavTheme(colors),
      colorScheme: colorScheme.copyWith(
        primary: colors.primary,
        secondary: colors.secondary,
        error: colors.error,
      ),
      inputDecorationTheme: _getInputDecoration(),
      elevatedButtonTheme: _getElevatedButtonTheme(isDark),
      switchTheme: _getSwitchThemeData(colors),
    );
  }
}

InputDecorationTheme _getInputDecoration() {
  return const InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 8),
  );
}

_getElevatedButtonTheme(bool isDark) {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))));
}

AppBarTheme _getAppBarTheme(bool isDark, ColorScheme colors) {
  const appBar = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    color: Colors.transparent,
  );

  if (isDark) {
    return appBar.copyWith(foregroundColor: colors.primary);
  } else {
    return appBar.copyWith(
      foregroundColor: colors.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

BottomNavigationBarThemeData _getBottomNavTheme(ColorScheme colors) {
  return BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: colors.primary,
    type: BottomNavigationBarType.fixed,
  );
}

SwitchThemeData _getSwitchThemeData(ColorScheme colors) {
  return SwitchThemeData(
      thumbColor: MaterialStateProperty.all(colors.primary),
      trackColor: MaterialStateProperty.all(colors.primary.withOpacity(0.3)));
}
