import 'package:flutter/material.dart';
import 'package:screlmt/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),

      home: HomeScreen(), // Your initial screen
    );
  }
}
