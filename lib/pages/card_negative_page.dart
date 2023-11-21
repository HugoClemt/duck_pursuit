import 'package:flutter/material.dart';

class CardNegativePage extends StatelessWidget {
  const CardNegativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Scaffold(
        body: Center(
          child: Text('Content of Card Negative Page'),
        ),
      ),
    );
  }
}
