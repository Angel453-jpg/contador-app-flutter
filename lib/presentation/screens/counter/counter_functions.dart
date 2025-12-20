import 'package:flutter/material.dart';
import 'package:hello_world_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    // Obtenemos acceso al provider (listen: true por defecto para redibujar iconos si es necesario)
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            onPressed: () {
              // Llamamos a la función para cambiar el tema
              themeProvider.toggleTheme();
            },
            //Cambiamos el icono según el estado
            icon: Icon(
              themeProvider.themeMode == ThemeMode.system
                  ? Icons.brightness_auto // Icono de "Automático/Sistema"
                  : themeProvider.themeMode == ThemeMode.light
                  ? Icons.light_mode_outlined // Icono de Sol
                  : Icons.dark_mode_outlined, // Icono de Luna
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              clickCounter == 1 ? 'Click' : 'Clicks',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),

          const SizedBox(height: 15),

          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            },
          ),

          const SizedBox(height: 15),

          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
