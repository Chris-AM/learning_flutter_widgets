import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_widgets/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
          final menuItem = appMenuItems[value].route;
          context.push(menuItem);
          widget.scaffoldKey.currentState?.closeDrawer();
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('First 3'),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 16, 10),
          child: Text('Items Left'),
        ),
        ...appMenuItems.sublist(3).map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
      ],
    );
  }
}
