import 'package:flutter/material.dart';
import 'view/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
        cardTheme: CardTheme(
          elevation: 8.0,
          color: Colors.teal.shade700,
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
        ),
        scaffoldBackgroundColor: Colors.teal.shade100,
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Dots',
              color: Colors.white,
              fontSize: 25,
            ),
            backgroundColor: Colors.teal.shade700),
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
