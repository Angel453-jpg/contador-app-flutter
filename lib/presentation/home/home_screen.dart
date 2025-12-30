import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions.dart';
import 'package:hello_world_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('App contador personalizada')),
      body: CounterFunctionsScreen(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
