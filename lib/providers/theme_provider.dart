import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/constants.dart';
import 'settings_provider.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class AppThemeNotifier extends _$AppThemeNotifier {
  static const String _themeKey = 'isDarkMode';

  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPrefProvider);
    final bool? isDark = prefs.getBool(_themeKey);

    return appThemeMode(isDark);
  }

  Future<void> updateTheme(BuildContext context, ThemeMode theme) async {
    final prefs = ref.read(sharedPrefProvider);

    switch (theme) {
      case ThemeMode.light:
        await prefs.setBool(_themeKey, false);
      case ThemeMode.dark:
        await prefs.setBool(_themeKey, true);
      case ThemeMode.system:
        await prefs.remove(_themeKey);
    }

    state = theme;

    if (!context.mounted) return;
    final brightness = Theme.of(context).brightness;
    updateColorsBasedOnTheme(brightness == Brightness.dark);
  }

  ThemeMode appThemeMode(bool? isDark) {
    return switch (isDark) {
      true => ThemeMode.dark,
      false => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }
}
