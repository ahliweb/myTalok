import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mFillColor,
      body: Stack(
        children: [
          Positioned(
            child: Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/svg/myTalok.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: mFillColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://desatalok.com/desa/logo/Untitled-1__sid__pgL3rFJ.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                "myTalok adalah aplikasi yang dibuat \n untuk memudahkan Warga Desa Talok mendapatkan akses informasi dan \n pelayanan digital  yang cepat,\n  realtime, serta terpantau. ",
                            style: mSectionTitleStyle,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Versi 1.0 beta'),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                "All right reserved © 2021. BUMDES MITRA TALOKA",
                            style: mSectionSubtitleStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
