import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';

class ComingssonScreen extends StatefulWidget {
  @override
  _ComingssonScreenState createState() => _ComingssonScreenState();
}

class _ComingssonScreenState extends State<ComingssonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mFillColor,
      body: Center(
        child: Text(
          'COMING SOON',
          style: mSectionTitleStyle,
        ),
      ),
      // bottomNavigationBar: BottomNavmyTalok(),
    );
  }
}
