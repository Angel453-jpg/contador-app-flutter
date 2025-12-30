import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/theme/app_theme.dart';

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//Un simple booleano
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Un objeto de tipo AppThem()
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
); // StateNotifierProvider

//Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  static const _themeModeKey = 'theme_mode';
  static const _selectedColorKey = 'selected_color';

  //STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme()) {
    _loadPreferences();
  }

  // Cambiar modo de tema
  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
  }

  // Cambiar color
  Future<void> changeColorIndex(int colorIndex) async {
    state = state.copyWith(selectedColor: colorIndex);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedColorKey, colorIndex);
  }

  // Carga el tema guardado
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    //Tema
    final savedTheme = prefs.getString(_themeModeKey);
    final themeMode = savedTheme != null
        ? ThemeMode.values.firstWhere(
            (e) => e.name == savedTheme,
            orElse: () => ThemeMode.system,
          )
        : ThemeMode.system;

    //Color
    final savedColor = prefs.getInt(_selectedColorKey) ?? 0;

    state = state.copyWith(themeMode: themeMode, selectedColor: savedColor);
  }
}
