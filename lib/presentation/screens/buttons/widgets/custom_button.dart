import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ColorScheme color;
  const CustomButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Text(
              'Custom Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
