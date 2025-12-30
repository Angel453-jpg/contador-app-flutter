import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int drawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: drawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          drawerIndex = value;
        });

        final menuItems = appMenuItems[value];
        context.push(menuItems.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text('Menu principal', style: Theme.of(context).textTheme.titleMedium),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),
        ...appMenuItems
            .sublist(0, 2)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
