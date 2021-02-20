import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';
import 'package:myTalok/models/carousel_model.dart';
import 'package:myTalok/models/travlog_model.dart';
import 'package:myTalok/screens/comingsoonScreen.dart';
import 'package:myTalok/screens/profileScreen.dart';
import 'package:myTalok/screens/webScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List artikels = [];
  List sliders = [];
  bool isLoading = false;

  var dapattoken;

  @override
  void initState() {
    super.initState();
    this.fetchArtikel();
    this.fetchSlider();
  }

  fetchSlider() async {
    var url = "https://desatalok.com/API/public/artikels?search[headline]=3";
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
        sliders = items;
      });
    } else {
      setState(() {
        sliders = [];
      });
    }
  }

  fetchArtikel() async {
    var url = "https://desatalok.com/API/public/LatestArtikels";
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
        artikels = items;
      });
    } else {
      setState(() {
        artikels = [];
      });
    }
  }

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // welcome
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              'Hi, Selamat datang di aplikasi myTalok',
              style: mTitleStyle,
            ),
          ),
          //slider
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Swiper(
                    onIndexChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    autoplay: true,
                    layout: SwiperLayout.DEFAULT,
                    itemCount: sliders.length,
                    itemBuilder: (BuildContext context, index) {
                      return getSlider(sliders[index]);
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: map<Widget>(sliders, (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6,
                          width: 6,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _current == index ? mBlueColor : mGreyColor),
                        );
                      }),
                    ),
                    //more
                    // Text(
                    //   'More...',
                    //   style: mMoreInfoStyle,
                    // )
                  ],
                ),
              ],
            ),
          ),
          // service
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Text(
              'Layanan',
              style: mTitleStyle,
            ),
          ),
          // tombol service
          Container(
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
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/layanan.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/info.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/lapor.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/ambulan.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
          // setion artikel
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Text(
              'Artikel Terkini',
              style: mTitleStyle,
            ),
          ),
          //artikels
          Container(
            height: 181,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: artikels.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return getArtikel(artikels[index]);
              },
            ),
          ),
          // Video Section
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
            child: Text(
              'Talok TV',
              style: mTitleStyle,
            ),
          ),
          Container(
            height: 181,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: travlogs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 104,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(travlogs[index].image),
                              ),
                            ),
                          ),
                          Positioned(
                            child:
                                SvgPicture.asset('assets/svg/top_corner.svg'),
                            right: 0,
                          ),
                          Positioned(
                            child: SvgPicture.asset(
                                'assets/svg/mytalok_logo_white.svg'),
                            right: 8,
                            top: 8,
                          ),
                          Positioned(
                            child: SvgPicture.asset(
                                'assets/svg/bottom_gradient.svg'),
                            bottom: 0,
                          ),
                          Positioned(
                            child: Text(
                              travlogs[index].name,
                              style: mSectionTitleStyle,
                            ),
                            bottom: 8,
                            left: 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        travlogs[index].content,
                        maxLines: 3,
                        style: mSectionSubtitleStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        travlogs[index].place,
                        style: mSectionPlaceStyle,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getArtikel(index) {
    var judul = index['judul'];
    var gambar = index['gambar'];
    var kategori = index['kategori'];
    var tgl = index['tgl_upload'];
    var parsedDate = DateTime.parse(tgl);
    String tglink = new DateFormat("yyyy/MM/dd").format(parsedDate);
    var slug = index['slug'];
    var link = 'https://desatalok.com/artikel/' + '$tglink' + '/' + '$slug';
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (gambar) != null
                        ? NetworkImage(
                            'https://desatalok.com/desa/upload/artikel/sedang_' +
                                '$gambar')
                        : NetworkImage(
                            'https://desatalok.com/desa/logo/myTalok.jpg'),
                  ),
                ),
              ),
              Positioned(
                child: SvgPicture.asset('assets/svg/bottom_gradient.svg'),
                bottom: 0,
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kategori.toString(),
                      style: mSectionCategoryStyle,
                    ),
                  ],
                ),
                bottom: 8,
                left: 8,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 30,
            child: Text(
              judul.toString(),
              maxLines: 3,
              style: mSectionTitleStyle,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebScreen(link),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: mBlueColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mBorderColor, width: 1)),
              child: Text(
                'Baca Selanjutnya',
                style: mSectionPlaceStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSlider(index) {
    var judul = index['judul'];
    var gambar = index['gambar'];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: (gambar) != null
                ? NetworkImage(
                    'https://desatalok.com/desa/upload/artikel/sedang_' +
                        '$gambar')
                : NetworkImage('https://desatalok.com/desa/logo/myTalok.jpg'),
            fit: BoxFit.cover),
      ),
      // child: Text('$judul'),
    );
  }
}
