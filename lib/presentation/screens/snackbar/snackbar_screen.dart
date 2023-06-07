import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});
  void showSnackbar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: const Text('Snackbar'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Title'),
        content: const Text(
          'Enim ullamco Lorem culpa nulla. Est fugiat labore proident aute magna adipisicing duis occaecat. Duis ullamco deserunt sint in aliquip adipisicing labore duis dolor ex officia. Laborum pariatur cillum sint id esse sunt irure sunt nostrud labore deserunt ex. Nostrud enim est sunt anim voluptate culpa minim ad reprehenderit id excepteur et. Consequat occaecat qui eu cupidatat nulla ad incididunt esse culpa consequat voluptate irure.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Ok!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const FlutterLogo(
                      size: 100,
                    ),
                  ],
                );
              },
              child: const Text('Licences'),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showSnackbar(context);
        },
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
