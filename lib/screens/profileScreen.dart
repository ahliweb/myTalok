import 'package:flutter/material.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/screens/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController controller = TextEditingController(text: "");
  bool isLogin = true;

  Future<String> getLog() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("lognik") ?? 'false';
  }

  Future<bool> getLogdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("islogin") ?? false;
  }

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    this.getLog();
    this.getLogdata();
    setState(
      () {
        getLog().then((s) {
          controller.text = s;
        });
      },
    );
    getLogdata().then((b) {
      setState(() {
        bool isLogin = b;
      });
    });
  }

  Widget _getlogin() {
    if (isLogin = false) {
      return LoginScreen();
    } else {
      return DataPenduduk(
        controller: controller,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getlogin(),
    );
  }
}

class DataPenduduk extends StatelessWidget {
  const DataPenduduk({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: TextField(
            controller: controller,
          ),
        ),
        RaisedButton(
          onPressed: logout,
        )
      ],
    );
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
