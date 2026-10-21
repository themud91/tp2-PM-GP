//imports
//main v2.0 avec les references vers home_page + styles
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // le widget root
    // avec style, theme et shape
    return MaterialApp(
      title: 'Dragon Ball',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 87, 43, 165),
          //theme "dark"
          brightness: Brightness.dark,
        ),

        //background main page
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBarTheme: const AppBarTheme(
          //couleur barre du haut
          backgroundColor: Color.fromARGB(255, 87, 43, 165),
          //couleur du texte/icones
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),

      home: const Scaffold(body: Center(child: Text('TP2'))),
    );
  }
}
