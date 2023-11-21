import 'package:duck_pursuit/pages/board_page.dart';
import 'package:duck_pursuit/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://iztnohtsanzwrkoyfsfk.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6dG5vaHRzYW56d3Jrb3lmc2ZrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1NTY0NTMsImV4cCI6MjAxNjEzMjQ1M30.a8WUjjbBPzj19wNIMveQniBDu14hxeHksOEaa5uLukg",
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoardPage(),
    );
  }
}
