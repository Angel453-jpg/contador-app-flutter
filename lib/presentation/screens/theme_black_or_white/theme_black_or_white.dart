import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_world_app/presentation/providers/theme_provider.dart';

class ThemeBlackOrWhite extends ConsumerWidget {
  static const String name = 'theme_black_or_white';

  const ThemeBlackOrWhite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeNotifierProvider);
    final themeMode = appTheme.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Modo Oscuro')),
      body: RadioGroup(
        groupValue: themeMode,
        onChanged: (value) {
          if (value == null) return;
          ref.read(themeNotifierProvider.notifier).setThemeMode(value);
        },
        child: const Column(
          children: [
            RadioListTile(title: Text('Activado'), value: ThemeMode.dark),
            RadioListTile(title: Text('Desactivado'), value: ThemeMode.light),
            RadioListTile(
              title: Text('Sistema'),
              subtitle: Text(
                'Ajustaremos la apariencia de acuerdo con la configuración del sistema operativo',
              ),
              value: ThemeMode.system,
            ),
          ],
        ),
      ),
    );
  }
}
