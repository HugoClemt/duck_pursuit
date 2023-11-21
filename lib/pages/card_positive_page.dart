import 'package:flutter/material.dart';

class CardPositivePage extends StatelessWidget {
  const CardPositivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Scaffold(
        body: Center(
          child: Text('Content of Card Positive Page'),
        ),
      ),
    );
  }
}
