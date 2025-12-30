import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // En lugar de bool, usamos ThemeMode. Por defecto: Sistema.
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  // Definimos el tema Claro
  ThemeData get lightTheme {
    return ThemeData(colorSchemeSeed: Colors.red, brightness: Brightness.light);
  }

  // Definimos el tema Oscuro
  ThemeData get darkTheme {
    return ThemeData(colorSchemeSeed: Colors.red, brightness: Brightness.dark);
  }

  // Función para cambiar entre los 3 modos
  void toggleTheme() async {
    if (_themeMode == ThemeMode.system) {
      _themeMode = ThemeMode.light;
    } else if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system;
    }

    notifyListeners();

    // Se guarda la elección (guardamos el índice: 0=system, 1=light, 2=dark)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', _themeMode.index);
  }

  // Función privada para cargar el tema
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // Leemos el entero guardado. Si no existe, usamos ThemeMode.system (index 0)
    final int? savedThemeIndex = prefs.getInt('theme_mode');

    if (savedThemeIndex != null) {
      _themeMode = ThemeMode.values[savedThemeIndex];
    } else {
      _themeMode = ThemeMode.system;
    }

    notifyListeners();
  }

}
