import 'package:flutter/material.dart';
import 'package:pasarbuahapp/main_screen.dart';
import 'package:pasarbuahapp/detail_screen.dart';

var informationTextStyle = TextStyle(
  fontFamily: 'IBMPlexSans',
);
//the main function is the starting point for all flutter apps.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        buttonColor: Colors.redAccent,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
    );
  }
}
