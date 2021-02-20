import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';

class LaporanScreen extends StatefulWidget {
  @override
  _LaporanScreenState createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
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
