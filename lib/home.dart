import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'screen/acc_page.dart';
import 'screen/home_page.dart';
import 'screen/qrcode_page.dart';
import 'screen/receipt_page.dart';
import 'screen/setting_page.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;

  //list of the screen
  List<Widget> screens = [
    const HomePage(),
    const AccPage(),
    const ReceiptPage(),
    const SettingPage()
  ];

  //list of the screen icon
  List<IconData> iconList = [
    Icons.home,
    Icons.account_balance_wallet,
    Icons.receipt,
    Icons.settings,
  ];

  // //List of the screen title
  // List<String> titleList = [
  //   'หน้าแรก',
  //   'บัญชี',
  //   'ใบเสร็จ',
  //   'ตั้งค่า',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: screens,
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
      //   tooltip: 'Increment',
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      //   onPressed: () {},
      //   child: const Icon(Icons.add, color: Colors.white, size: 28),
      // ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(context, PageTransition(child: const QrcodePage(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: const Icon(Icons.qr_code, color: Colors.white, size: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
    );
  }
}
