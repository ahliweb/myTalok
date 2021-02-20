import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/screens/akunScreen.dart';
import 'package:myTalok/screens/infoScreen.dart';
import 'package:myTalok/screens/kategoriScreen.dart';
import 'package:myTalok/screens/laporanScreen.dart';
import 'package:myTalok/screens/loginScreen.dart';
import 'package:myTalok/screens/mandiriwebScreen.dart';
import 'package:myTalok/screens/masukScreen.dart';
import 'package:myTalok/screens/profileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex;
  String url = "";
  bool isLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    this.getLog();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  getLog() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isLogin") ?? false;
  }

  // var value;

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     value = preferences.getInt("value");

  //     _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
  //   });
  // }

  // Future<void> cek() {
  //   // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
  //   //   return isLogin ? new ProfileScreen() : new LoginScreen();
  //   // }));
  //   if (isLogin != null) {
  //     Navigator.push(
  //       context,
  //       // MaterialPageRoute(
  //       //   builder: (context) => MandiriwebScreen(
  //       //       url = 'https://desatalok.com/layanan-mandiri/'),
  //       // ),
  //       MaterialPageRoute(
  //         builder: (context) => ProfileScreen(),
  //       ),
  //     );
  //   } else {
  //     Navigator.push(
  //       context,
  //       // MaterialPageRoute(
  //       //   builder: (context) => MandiriwebScreen(
  //       //       url = 'https://desatalok.com/layanan-mandiri/'),
  //       // ),
  //       MaterialPageRoute(
  //         builder: (context) => LoginScreen(),
  //       ),
  //     );
  //   }
  // }

  Future cekLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isLogin = pref.getBool("isLogin") ?? false;
    });
  }

  Widget _getWidget() {
    if (currentIndex == 0) {
      return MainScreen();
    } else if (currentIndex == 1) {
      return LaporanScreen();
    } else if (currentIndex == 2) {
      return KategoriScreen();
    } else if (currentIndex == 3) {
      return LoginScreen();
    }
    return MainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mBlueColor, //change your color here
        ),
        leading: Icon(Icons.menu),
        centerTitle: true,
        backgroundColor: mBackgroundColor,
        title: Image.asset('assets/svg/myTalok_logo.png'),
        elevation: 0,
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
      body: _getWidget(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: cek,
      //   child: Icon(
      //     Icons.account_circle_rounded,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Colors.blue[800],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasInk: false,
        inkColor: Colors.blue[800],
        hasNotch: true,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.blue[800],
            icon: Icon(
              Icons.home,
              color: mTitleColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue[800],
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.blue[800],
            icon: Icon(
              Icons.book_rounded,
              color: mTitleColor,
            ),
            activeIcon: Icon(
              Icons.book_rounded,
              color: Colors.blue[800],
            ),
            title: Text('Laporan'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.blue[800],
            icon: Icon(
              Icons.work_rounded,
              color: mTitleColor,
            ),
            activeIcon: Icon(
              Icons.work_rounded,
              color: Colors.blue[800],
            ),
            title: Text('Kategori'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.blue[800],
            icon: Icon(
              Icons.account_circle_rounded,
              color: mTitleColor,
            ),
            activeIcon: Icon(
              Icons.account_circle_rounded,
              color: Colors.blue[800],
            ),
            title: Text('Akun'),
          ),
        ],
        // fabLocation: BubbleBottomBarFabLocation.end,
        onTap: changePage,
        opacity: 0.2,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
    );
  }
}
