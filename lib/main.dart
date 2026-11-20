import 'package:flutter/material.dart';
import 'screens/movie_form_screen.dart';
void main() {
  runApp(const filmotekaApp());
}

class filmotekaApp extends StatelessWidget {
  const filmotekaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmoteka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme:  ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MovieFormScreen(),
    );
  }
}

      
    
  

