import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions.dart';
import 'package:hello_world_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Inyectamos el provider en la cima del árbol de widgets
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos los cambios del tema
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 1. Asignamos el tema claro
      theme: themeProvider.lightTheme,
      // 2. Asignamos el tema oscuro
      darkTheme: themeProvider.darkTheme,
      // 3. Le decimos a Flutter cuál usar (Light, Dark o System)
      themeMode: themeProvider.themeMode,
      home: CounterFunctionsScreen(),
    );
  }
}
