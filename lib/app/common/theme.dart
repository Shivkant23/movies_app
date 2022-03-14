import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.amber,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
    primaryColor: Colors.amber,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.amber,
      unselectedIconTheme: IconThemeData(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black45),
      selectedLabelStyle: TextStyle(color: Colors.black45),
      selectedItemColor: Colors.black45,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.amber),
    iconTheme: IconThemeData(color: Colors.black45),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white38),
    primaryColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedIconTheme: IconThemeData(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.white54),
      selectedLabelStyle: TextStyle(color: Colors.white54),
      selectedItemColor: Colors.white54,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
  );
}
