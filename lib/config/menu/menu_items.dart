import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.route,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subTitle: 'How to work with buttons in Flutter',
    route: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Customized Containers',
    route: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Standards and controlled',
    route: '/progress',
    icon: Icons.donut_large_sharp,
  ),
  MenuItem(
    title: 'Snackbar and dialogs',
    subTitle: 'Screen Alerts',
    route: '/snackbar',
    icon: Icons.cookie_outlined,
  ),
  MenuItem(
    title: 'Animated Containers',
    subTitle: 'Animated Stateful Widget',
    route: '/animated',
    icon: Icons.animation_outlined,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'List of Flutter Controls',
    route: '/control_and_tiles',
    icon: Icons.switch_left_rounded,
  ),
  MenuItem(
    title: 'App Tutorial',
    subTitle: 'How To Use This App',
    route: '/tutorial',
    icon: Icons.question_mark_rounded,
  ),
  MenuItem(
    title: 'Infinite Scroll And Pull',
    subTitle: 'Lazy load Infinite Scroll',
    route: '/infinite_scroll',
    icon: Icons.ad_units_outlined,
  ),
  MenuItem(
    title: 'Counter',
    subTitle: 'Learning how to use Riverpod',
    route: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Using Riverpod to manage theme',
    route: '/theme_config',
    icon: Icons.color_lens_rounded,
  ),
];
