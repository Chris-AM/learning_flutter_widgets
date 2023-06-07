import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_widgets/config/menu/menu_items.dart';
import 'package:learning_widgets/presentation/screens/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter Widgets + Material 3'),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  final buttons = appMenuItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final String title = appMenuItems[index].title;
        final String subTitle = appMenuItems[index].subTitle;
        final IconData icon = appMenuItems[index].icon;
        final String route = appMenuItems[index].route;
        return _CustomListTile(
          icon: icon,
          title: title,
          subTitle: subTitle,
          route: route,
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final String route;

  const _CustomListTile({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        icon,
        color: colors.primary,
      ),
      trailing: Platform.isAndroid
          ? const Icon(Icons.arrow_forward)
          : const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: () {
        context.push(route);
        // context.pushNamed(name);
      },
    );
  }
}
