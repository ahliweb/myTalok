import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';
import 'package:myTalok/screens/akunScreen.dart';
import 'package:myTalok/screens/profileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MasukScreen extends StatefulWidget {
  MasukScreen({Key key}) : super(key: key);
  @override
  _MasukScreenState createState() => _MasukScreenState();
}

class _MasukScreenState extends State<MasukScreen> {
  // final formKey = GlobalKey<FormState>();
  final nikController = TextEditingController();

  bool visible = false;
  // bool isLogin;
  List datanik = [];
  String nik = "";

  // Future cekLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   isLogin = pref.getBool("isLogin") ?? false;
  //   if (isLogin == true) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => new AkunScreen()));
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cekLogin();
  }

  prosesLogin() async {
    setState(() {
      visible = true;
    });
    var getnik = nikController.text;
    var url = "https://desatalok.com/API/public/mandiri?search[nik]=" + getnik;
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MCIsImlhdCI6MTM1Njk5OTUyNCwiZW1haWwiOiJhZG1pbiIsIm5iZiI6MTM1NzAwMDAwMH0.jbssBLQNsaFHLyIuKmNlIsO4dfzPQLdZT25HC3QBMVw";

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(response.body);

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data'];
      setState(() {
        datanik = items;
      });

      if (datanik.length == 1) {
        //simpan shared
        final SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("lognik", nikController.text);
        pref.setBool("isLogin", true);
        //pindah page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new AkunScreen()));
      } else {
        final SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("islogin", false);
      }
    } else {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("islogin", false);
    }
  }

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
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://desatalok.com/assets/css/images/latar_login.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
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
            buildTombol(true),
            Positioned(
              top: 150,
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
                          TextField(
                            controller: nikController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: mBlueColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: mBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Masukkan NIK",
                              hintStyle:
                                  TextStyle(fontSize: 14, color: mBorderColor),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // TextField(
                          //   // controller: pinController,
                          //   obscureText: _obscureText,
                          //   decoration: InputDecoration(
                          //     prefixIcon: Icon(
                          //       Icons.lock,
                          //       color: mBlueColor,
                          //     ),
                          //     suffixIcon: IconButton(
                          //       icon: Icon(
                          //         Icons.remove_red_eye_rounded,
                          //         size: 20,
                          //       ),
                          //       onPressed: _toggle,
                          //     ),
                          //     focusColor: mBlueColor,
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(color: mBorderColor),
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(35.0),
                          //       ),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(color: mBorderColor),
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(35.0),
                          //       ),
                          //     ),
                          //     contentPadding: EdgeInsets.all(10),
                          //     hintText: "Masukkan PIN",
                          //     hintStyle:
                          //         TextStyle(fontSize: 14, color: mBorderColor),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    "Silakan datang atau hubungi operator desa untuk mendapatkan kode PIN anda.",
                                style: mSectionSubtitleStyle,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            buildTombol(false),
          ],
        ),
      ),
    );
  }

  Positioned buildTombol(bool showShadow) {
    return Positioned(
      top: 400,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: mFillColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                    offset: Offset(0, 1))
            ],
          ),
          child: !showShadow
              ? Container(
                  child: InkWell(
                    onTap: prosesLogin,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue[200], Colors.blue[900]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }
}
