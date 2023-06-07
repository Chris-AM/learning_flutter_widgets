import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_widgets/presentation/providers/providers.dart';

class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge;
    final int counter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(globalAppThemeProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Riverpod'),
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
      body: Center(
        child: Text(
          'Value: $counter',
          style: titleStyle,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            heroTag: 'remove',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            heroTag: 'add',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state = 0;
            },
            heroTag: 'reset',
            child: const Icon(Icons.restart_alt_rounded),
          ),
        ],
      ),
    );
  }
}
