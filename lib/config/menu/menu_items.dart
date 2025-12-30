import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Modo Oscuro',
    subTitle: 'Configuración general',
    link: '/configuration',
    icon: Icons.dark_mode_outlined,
  ),
  MenuItems(
    title: 'Configuración de tema',
    subTitle: 'Configuración del color de la aplicación',
    link: '/theme',
    icon: Icons.color_lens_outlined,
  ),
];
