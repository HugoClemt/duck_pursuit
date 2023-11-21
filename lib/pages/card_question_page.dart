import 'package:flutter/material.dart';

class CardQuestionPage extends StatefulWidget {
  const CardQuestionPage({super.key});

  @override
  State<CardQuestionPage> createState() => _CardQuestionPageState();
}

class _CardQuestionPageState extends State<CardQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Deuxième image en arrière-plan
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/face_card_question.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Premier Container avec la première image en arrière-plan
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_board.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  'Content of Card Question Page',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
