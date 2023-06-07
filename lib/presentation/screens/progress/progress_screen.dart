import 'package:flutter/material.dart';
import 'package:learning_widgets/presentation/screens/widgets/shared/buttons/custom_floating_button.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(backgroundColor: Colors.black12),
          SizedBox(
            height: 30,
          ),
          Text('Controlled Progress Indicator'),
          SizedBox(
            height: 30,
          ),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(
            const Duration(
              milliseconds: 300,
            ), (value) {
          return (value * 2) / 100;
        }).takeWhile((element) => element < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text('Circular: '),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progressValue,
                      strokeWidth: 2,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progressValue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
