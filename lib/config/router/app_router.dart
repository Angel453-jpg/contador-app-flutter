import 'package:go_router/go_router.dart';
import 'package:hello_world_app/presentation/home/home_screen.dart';
import 'package:hello_world_app/presentation/screens/theme_black_or_white/theme_black_or_white.dart';
import 'package:hello_world_app/presentation/screens/theme_changer_screen/theme_changer_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/configuration',
      name: ThemeBlackOrWhite.name,
      builder: (context, state) => ThemeBlackOrWhite(),
    ),
    GoRoute(
      path: '/theme',
      name: ThemeChangerScreen.name,
      builder: (context, state) => ThemeChangerScreen(),
    ),
  ],
);
