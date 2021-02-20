import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';
import 'package:myTalok/screens/webScreen.dart';

import 'comingsoonScreen.dart';

class AkunScreen extends StatefulWidget {
  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mFillColor,
      body: Scaffold(
        backgroundColor: mFillColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://desatalok.com/assets/css/images/latar_login.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  color: mBlueColor.withOpacity(.50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Selamat Datang di",
                          style: TextStyle(
                            letterSpacing: 3,
                            fontSize: 16,
                            color: Colors.yellow[700],
                          ),
                        ),
                      ),
                      Text(
                        'Layanan Mandiri Desa Talok',
                        style: TextStyle(
                            fontSize: 16,
                            color: mFillColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              child: Container(
                height: 200,
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
                child: Row(
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
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Pemerintah Desa Talok Kec. Turen"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "3507090709910002",
                              style: mTitleStyle,
                            ),
                            Divider(color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [Text("Nama"), Text("Alamat")],
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120,
              width: MediaQuery.of(context).size.width - 40,
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 50, left: 40, right: 10),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Nama"),
                        SizedBox(
                          width: 60,
                        ),
                        Text(": " + "Evan Helga Suganda"),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 10),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Jenis Kelamin"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(": " + "Laki Laki"),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 10),
                  child: Row(children: [
                    Text("Alamat"),
                    SizedBox(
                      width: 55,
                    ),
                    Text(": " + "Jl. Jatirenggo No 38"),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 10),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("RT / RW"),
                        SizedBox(
                          width: 50,
                        ),
                        Text(": " + "04" + " / " + "09"),
                      ]),
                ),
              ]),
            ),
            Positioned(
              top: 320,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  height: 144,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebScreen(
                                        'https://desatalok.com/layanan-mandiri/permohonan-surat'),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 64,
                                decoration: BoxDecoration(
                                    color: mFillColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: mBorderColor, width: 1)),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/svg/layanan.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Surat',
                                            style: mServiceTitleStyle,
                                          ),
                                          Text(
                                            'Layanan Mandiri',
                                            style: mServiceSubtitleStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComingssonScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 64,
                                decoration: BoxDecoration(
                                    color: mFillColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: mBorderColor, width: 1)),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/svg/info.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Info',
                                            style: mServiceTitleStyle,
                                          ),
                                          Text(
                                            'Informasi Terkini',
                                            style: mServiceSubtitleStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebScreen(
                                        'https://desatalok.com/layanan-mandiri/pesan/tulis'),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 64,
                                decoration: BoxDecoration(
                                    color: mFillColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: mBorderColor, width: 1)),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/svg/lapor.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Lapor',
                                            style: mServiceTitleStyle,
                                          ),
                                          Text(
                                            'Call Center',
                                            style: mServiceSubtitleStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComingssonScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 64,
                                decoration: BoxDecoration(
                                    color: mFillColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: mBorderColor, width: 1)),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/svg/ambulan.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Ambulan',
                                            style: mServiceTitleStyle,
                                          ),
                                          Text(
                                            'Emergency Call',
                                            style: mServiceSubtitleStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
