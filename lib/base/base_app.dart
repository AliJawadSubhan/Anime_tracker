import 'package:anime_tracing_app/views/home/home_View.dart';
import 'package:flutter/material.dart';

class AnimeTracingApp extends StatelessWidget {
  const AnimeTracingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}
