import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_widgets/config/theme/app_theme.dart';
import 'package:learning_widgets/presentation/providers/providers.dart';

class ThemeChanger extends ConsumerWidget {
  static String name = 'theme_changer';
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(globalAppThemeProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your color! '),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_rounded)
                : const Icon(Icons.light_mode_rounded),
            onPressed: () {
              ref.read(globalAppThemeProvider.notifier).toggleDarkTheme();
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, Color> colorList = ref.watch(colorListProvider);
    final int colorIndex = ref.watch(globalAppThemeProvider).selectedColor;
    final List<String> colorNames = colorList.keys.toList();
    final List<Color> colors = colorList.values.toList();
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final String colorName = colorNames[index];
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            colorName,
            style: TextStyle(color: color),
          ),
          subtitle: Text('RGB: (${color.red}, ${color.green}, ${color.blue})'),
          activeColor: color,
          value: index,
          groupValue: colorIndex,
          onChanged: (value) {
            ref
                .read(globalAppThemeProvider.notifier)
                .toggleSelectedColor(index);
            GlobalAppTheme(selectedColor: index).getTheme();
          },
        );
      },
    );
  }
}
