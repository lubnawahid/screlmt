import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmt/provider/provider.dart';
import 'package:screlmt/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> UserProvider(),
  child: MaterialApp(

      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
debugShowCheckedModeBanner: false,
      home: HomeScreen(),
  ),// Your initial screen
    );
  }
}
