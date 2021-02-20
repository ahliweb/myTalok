import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myTalok/constants/color_constant.dart';
import 'package:myTalok/screens/homeScreen.dart';
import 'package:myTalok/screens/profileScreen.dart';

class BottomNavmyTalok extends StatefulWidget {
  @override
  _BottomNavmyTalokState createState() => _BottomNavmyTalokState();
}

class _BottomNavmyTalokState extends State<BottomNavmyTalok> {
  int _selectedIndex = 0;
  var bottomTextStyle =
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new SvgPicture.asset('assets/icons/home_colored.svg')
                : new SvgPicture.asset('assets/icons/home.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Home',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/icons/watch_colored.svg')
                : new SvgPicture.asset('assets/icons/watch.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Laporan',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/icons/order_colored.svg')
                : new SvgPicture.asset('assets/icons/order.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Kategori',
              style: bottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new SvgPicture.asset('assets/icons/account_colored.svg')
                : new SvgPicture.asset('assets/icons/account.svg'),
            // ignore: deprecated_member_use
            title: Text(
              'Akun',
              style: bottomTextStyle,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
