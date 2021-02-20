import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:myTalok/constants/color_constant.dart';

import 'infoScreen.dart';

class WebScreen extends StatelessWidget {
  String link;
  WebScreen(this.link);

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
      body: Builder(
        builder: (BuildContext context) {
          return InAppWebView(
            initialUrl: link,
            initialHeaders: {},
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                debuggingEnabled: false,
                javaScriptCanOpenWindowsAutomatically: false,
                javaScriptEnabled: true,
                useOnDownloadStart: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
