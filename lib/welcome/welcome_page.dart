import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cat_1/pages/home_page.dart';
import 'package:flutter_cat_1/pages/intro_page.dart';
import 'package:flutter_cat_1/tools/tools.dart';
import 'package:flutter_cat_1/web/web_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int second_index = 3;
  int timeIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(milliseconds: 50),
      (sd) {
        setState(() {
          timeIndex += 1;
          if (timeIndex % 20 == 0) {
            second_index -= 1;
          }
        });
        if (timeIndex >= 100) {
          _openMain();
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/IMG_8050.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: () {
                  _openMain();
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        value: timeIndex / 100,
                        strokeWidth: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "跳过",
                        style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Flutter开发日常练习",
                    style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                          text: "-小猫咪杂货店",
                          style: GoogleFonts.notoSerif(
                            color: Colors.black,
                            fontSize: 17,
                            // decoration: TextDecoration.underline,
                            // decorationColor: Colors.blue[800],
                          )),
                    ],
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'CSDN关注',
                    style: GoogleFonts.notoSerif(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'workersJiaDa',
                          style: GoogleFonts.notoSerif(
                            fontSize: 17,
                            color: Colors.blue[800],
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              timer.cancel();
                              Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) => WebPage(
                                          url:
                                              "https://blog.csdn.net/zxc8890304",
                                          title: "workersJiaDa的博客"),
                                    ),
                                  )
                                  .then((value) => reGetTimer());
                            }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: '抖音商城搜索',
                    style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                        text: "早睡早起的猫咪小铺子",
                        style: GoogleFonts.notoSerif(
                          fontSize: 17,
                          color: Colors.blue[800],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // timer.cancel();
                            launchURL('snssdk1128://user/profile/88486395468');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openMain() {
    timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false);
  }

  void reGetTimer() {
    timer = Timer.periodic(
      Duration(milliseconds: 50),
      (sd) {
        setState(() {
          timeIndex += 1;
          if (timeIndex % 20 == 0) {
            second_index -= 1;
          }
        });
        if (timeIndex >= 100) {
          _openMain();
        }
      },
    );
  }
}
