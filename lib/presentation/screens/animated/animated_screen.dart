import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  double borderRadius = 50.0;
  Color color = Colors.indigoAccent;

  void changeChape() {
    final random = Random();
    setState(() {
      width = random.nextInt(400) + 150;
      height = random.nextInt(500) + 150;
      borderRadius = random.nextInt(100) + 20;
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(
            seconds: 2,
          ),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeChape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
