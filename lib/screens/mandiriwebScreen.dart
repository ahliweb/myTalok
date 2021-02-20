import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:myTalok/constants/color_constant.dart';

import 'infoScreen.dart';

class MandiriwebScreen extends StatelessWidget {
  String link;
  MandiriwebScreen(this.link);
  InAppWebViewController webView;

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
                  userAgent:
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0"),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, String url) {},
            onLoadStop: (InAppWebViewController controller, String url) async {
              if (link.contains('/masuk?')) {
                // if JavaScript is enabled, you can use
                var html = await controller.evaluateJavascript(
                    source: "window.document.body.innerText");

                log(html);
              }
            },
          );
        },
      ),
    );
  }
}
