import "package:duck_pursuit/pages/card_negative_page.dart";
import "package:duck_pursuit/pages/card_positive_page.dart";
import "package:duck_pursuit/pages/card_question_page.dart";
import "package:flutter/material.dart";

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_board.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardNegativePage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/card_negative.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardQuestionPage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/card_question.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardPositivePage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/card_positive.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
