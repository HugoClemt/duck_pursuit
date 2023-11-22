import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardQuestionPage extends StatefulWidget {
  const CardQuestionPage({Key? key}) : super(key: key);

  @override
  State<CardQuestionPage> createState() => _CardQuestionPageState();
}

class _CardQuestionPageState extends State<CardQuestionPage> {
  final _fetchQuestionData = Supabase.instance.client
      .from('questions')
      .select('question, answer') as PostgrestBuilder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_board.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: _fetchQuestionData.execute().then((response) {
                      List<dynamic> data = response.data as List<dynamic>;

                      if (data.isNotEmpty) {
                        data.shuffle(Random());
                        return data.cast<Map<String, dynamic>>();
                      } else {
                        return <Map<String, dynamic>>[];
                      }
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Erreur : ${snapshot.error}'),
                        );
                      }

                      final List<Map<String, dynamic>> questionsAndAnswers =
                          snapshot.data ?? [];

                      if (questionsAndAnswers.isNotEmpty) {
                        final Map<String, dynamic> questionAndAnswer =
                            questionsAndAnswers[0];

                        return Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/face_card_question.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 60.0,
                                    left: 60.0,
                                    right: 60.0,
                                    top: 35.0),
                                child: Text(
                                  'Question : ${questionAndAnswer['question'] ?? 'N/A'}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(pi),
                                  child: Text(
                                    'Answer : ${questionAndAnswer['answer'] ?? 'N/A'}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('Aucune donnée disponible.'),
                        );
                      }
                    },
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
