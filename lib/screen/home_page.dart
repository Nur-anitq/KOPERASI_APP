import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:koperasiapp/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, Constraints) {
          return Container(
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Constants.primaryColor,
                        ),
                        Image.asset(
                          'assets/images/background/bg1.png',
                          fit: BoxFit.cover,
                          width: screenWidth,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 70,
                                    height: screenHeight * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset('assets/images/pro.png'),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'คุณทดสอบระบบ  ไอที',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  width: screenWidth,
                  color: Constants.white,
                  height: screenHeight * 0.6,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
