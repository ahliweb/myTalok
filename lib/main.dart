import 'package:flutter/material.dart';
import 'package:myTalok/screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myTalok',
      home: HomeScreen(),
    );
  }
}
