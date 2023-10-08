import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static ThemeData myLightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      // button decoration
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            // minimumSize: Size(45, 45), // can be used too.
            textStyle:
                const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
            foregroundColor: CupertinoColors.white,
            backgroundColor: CupertinoColors.systemPurple),
      ),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 24),
      ),
    );
  }

  static ThemeData myDarkTheme() {
    return ThemeData(brightness: Brightness.dark);
  }
}
