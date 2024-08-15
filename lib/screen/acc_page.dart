import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';
import 'qrcode_page.dart';
import 'signup_screen.dart';

class AccPage extends StatelessWidget {
  const AccPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formSignInKey = GlobalKey<FormState>();
    final _navigatorKey =GlobalKey<NavigatorState>();
    return MaterialApp(
      navigatorKey: _navigatorKey,  // This is where the navigatorKey should go
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Constants.primaryColor,
            title: const Center(
              child: Text(
                'บัญชีออมทรัพย์',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ),
          body: SingleChildScrollView(
            key: _formSignInKey,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.stop,
                        color: Color.fromARGB(255, 0, 87, 31),
                        size: 30.0,
                      ),
                      Text(
                        'บัญชีของฉัน',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const QrcodePage(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: const AccCard(),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const AccCard(),
                ],
              ),
            ),
          )),
    );
  }
}

// ACC CARD STYLE
class AccCard extends StatelessWidget {
  const AccCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 10.0,
                  offset: Offset(0, 5))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'บัญชีวาดีอะห์ (ออนไลน์)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ยอดเงินคงเหลือ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Divider(),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'นายทดสอบระบบ ไอที',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '200.00',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '005-08-000017',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Positioned(
                                              // top: 50,
                                              // left: 10,
                                              child: Image.asset(
                                                'assets/images/credit-card.png',
                                                height: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
