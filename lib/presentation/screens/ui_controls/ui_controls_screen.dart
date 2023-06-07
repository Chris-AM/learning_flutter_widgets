import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = 'control_and_tiles';
  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls And Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation transportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Advanced Controls'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Selected Transportation'),
          subtitle: Text('$transportation'),
          leading: const Icon(Icons.car_rental),
          initiallyExpanded: true,
          children: [
            RadioListTile(
              title: const Text('By car'),
              value: Transportation.car,
              groupValue: transportation,
              onChanged: (value) => setState(() {
                transportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              value: Transportation.plane,
              groupValue: transportation,
              onChanged: (value) => setState(() {
                transportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              value: Transportation.boat,
              groupValue: transportation,
              onChanged: (value) => setState(() {
                transportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              value: Transportation.submarine,
              groupValue: transportation,
              onChanged: (value) => setState(() {
                transportation = Transportation.submarine;
              }),
            ),
          ],
        ),

      ],
    );
  }
}
