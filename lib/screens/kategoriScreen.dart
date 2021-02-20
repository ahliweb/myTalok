import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/constants/style_constant.dart';
import 'package:myTalok/screens/detailkategoriScreen.dart';

class KategoriScreen extends StatefulWidget {
  @override
  _KategoriScreenState createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  List kategoris = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchKategori();
  }

  fetchKategori() async {
    var url = "https://desatalok.com/API/public/kategoris?search[enabled]=1";
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MCIsImlhdCI6MTM1Njk5OTUyNCwiZW1haWwiOiJhZG1pbiIsIm5iZiI6MTM1NzAwMDAwMH0.jbssBLQNsaFHLyIuKmNlIsO4dfzPQLdZT25HC3QBMVw";
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data'];
      setState(() {
        kategoris = items;
      });
    } else {
      setState(() {
        kategoris = [];
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
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: kategoris.length,
              // scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return getKategori(kategoris[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getKategori(index) {
    var kategoriname = index['kategori'];
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailkategoriScreen(index, kategoriname),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.read_more,
                  color: mBlueColor,
                ),
                title: Text(
                  kategoriname,
                  style: mTitleStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
