// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Screens/inpute_page.dart';

void main() => runApp(HealthBmiCalculator());

class HealthBmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF090E21),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF090E21)
          ),
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.red,
            ),
        ),
      ),

      home: InputPage(),
    );
  }
}

