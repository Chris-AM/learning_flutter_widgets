import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.pop();
      },
      child: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}