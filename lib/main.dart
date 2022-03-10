import 'package:flutter/material.dart';
import 'view/homepage.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        cardTheme: CardTheme(
          elevation: 8.0,
          color: Colors.grey[800],
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
        ),
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Dots',
              color: Colors.white,
              fontSize: 25,
            ),
            backgroundColor: Colors.grey[800],
        ),
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
