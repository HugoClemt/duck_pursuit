import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardPositivePage extends StatefulWidget {
  const CardPositivePage({Key? key});

  @override
  State<CardPositivePage> createState() => _CardPositivePageState();
}

class _CardPositivePageState extends State<CardPositivePage> {
  final _fetchChanceData = Supabase.instance.client
      .from('chances')
      .select('chance') as PostgrestBuilder;

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
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _fetchChanceData.execute().then((response) {
                    List<dynamic> data = response.data as List<dynamic>;

                    if (data.isNotEmpty) {
                      data.shuffle();
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

                    final List<Map<String, dynamic>> chances =
                        snapshot.data ?? [];

                    if (chances.isNotEmpty) {
                      final Map<String, dynamic> chance = chances[0];

                      return Container(
                        width: 540,
                        height: 348,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/face_card_positive.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Text(
                              'Chance : ${chance['chance'] ?? 'N/A'}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
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
          ],
        ),
      ),
    );
  }
}
