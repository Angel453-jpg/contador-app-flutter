import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.pinkAccent,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final ThemeMode themeMode;

  AppTheme({this.selectedColor = 0, this.themeMode = ThemeMode.system})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme(Brightness systemBrightness) {
    final isDark = themeMode == ThemeMode.system
        ? systemBrightness == Brightness.dark
        : themeMode == ThemeMode.dark;

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
    );
  }

  AppTheme copyWith({int? selectedColor, ThemeMode? themeMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    themeMode: themeMode ?? this.themeMode,
  );
}
