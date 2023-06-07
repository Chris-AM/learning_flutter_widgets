import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_widgets/presentation/screens/buttons/widgets/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Platform.isAndroid
            ? const Icon(Icons.arrow_back_rounded)
            : const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          children: const [
            FlutterLogo(),
            SizedBox(
              width: 20,
            ),
            Text('Flutter Buttons'),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Elevated Disabled'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.elevator_outlined),
                  label: const Text('Elevated Button'),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_copy),
                  label: const Text('Filled Icon'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields_rounded),
                  label: const Text('Text Icon'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home_max_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home_mini),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    iconColor: const MaterialStatePropertyAll(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const [
            FlutterLogo(),
            SizedBox(
              width: 20,
            ),
            Text('Custom Buttons'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(color: colors),
      ],
    );
  }
}
