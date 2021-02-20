import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';

import 'infoScreen.dart';

class DetailkategoriScreen extends StatelessWidget {
  int index;
  String kategoriname;

  DetailkategoriScreen(index, kategoriname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mBlueColor, //change your color here
        ),
        centerTitle: true,
        backgroundColor: mBackgroundColor,
        title: Image.asset('assets/svg/myTalok_logo.png'),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_rounded,
              color: mBlueColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('kategoriname'),
      ),
    );
  }
}
