import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_widgets/config/router/app_router.dart';
import 'package:learning_widgets/config/theme/app_theme.dart';
import 'package:learning_widgets/presentation/providers/providers.dart';

void main(List<String> args) {
  runApp(
    //? ProviderScope = Riverpod
    const ProviderScope(
      child: LearningWidgets(),
    ),
  );
}

class LearningWidgets extends ConsumerWidget {
  const LearningWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(darkModeProvider);
    // final int themeColor = ref.watch(selectedColorIndexProvider);
    final GlobalAppTheme appTheme = ref.watch(globalAppThemeProvider);
    return MaterialApp.router(
      title: 'Learning Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
