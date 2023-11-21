import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardNegativePage extends StatefulWidget {
  const CardNegativePage({Key? key});

  @override
  State<CardNegativePage> createState() => _CardNegativePageState();
}

class _CardNegativePageState extends State<CardNegativePage> {
  final _fetchMalusData = Supabase.instance.client
      .from('malus')
      .select('penalty') as PostgrestBuilder;

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
                  future: _fetchMalusData.execute().then((response) {
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

                    final List<Map<String, dynamic>> maluses =
                        snapshot.data ?? [];

                    if (maluses.isNotEmpty) {
                      final Map<String, dynamic> malus = maluses[0];

                      return Container(
                        width: 540,
                        height: 348,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/face_card_negative.png'),
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
                              'Penalty : ${malus['penalty'] ?? 'N/A'}',
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
