import 'package:flutter/material.dart';

class FavorTheme {

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      bodySmall: const TextStyle(fontSize: 10),
      bodyMedium: const TextStyle(fontSize: 12),
      bodyLarge: const TextStyle(fontSize: 14),
      displaySmall: const TextStyle(fontSize: 16, color: Colors.black87),
      displayMedium: const TextStyle(fontSize: 20, color: Colors.black87),
      displayLarge: const TextStyle(fontSize: 23, color: Colors.black87),
    )
  );
}