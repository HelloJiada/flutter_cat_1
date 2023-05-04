import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cat_1/welcome/welcome_page.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_util/sp_util.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isLogin = false;
  bool _isFirst = false;
  bool _islastPage = false;
  int pageInt = 1;
  final List _welcomeList = ["welcome_1.png", "welcome_2.png", "welcome_3.png"];

  @override
  void initState() {
    super.initState();
    _isFirst = SpUtil.getBool("first")!;

    if (_isFirst) {
      String? tokenStr = SpUtil.getString('token');
      _isLogin = (tokenStr == null || tokenStr.isEmpty) ? false : true;
      new Future.delayed(Duration(seconds: 0), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: Colors.white,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Swiper(
            itemBuilder: (context, index) {
              return Image.asset(
                "assets/${_welcomeList[index]}",
                fit: BoxFit.cover,
              );
            },
            itemCount: _welcomeList.length,
            loop: false,
            onIndexChanged: (index) {
              pageInt = index + 1;
              if (index == _welcomeList.length - 1) {
                setState(() {
                  _islastPage = true;
                });
              } else {
                setState(() {
                  _islastPage = false;
                });
              }
            },
          ),
          Container(
            width: 100,
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: ScreenUtil().screenWidth / 2 - 50,
              bottom: 40,
              top: ScreenUtil().screenHeight - 80,
              right: ScreenUtil().screenWidth / 2 - 50,
            ),
            child: Text(
              "$pageInt / 3",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            width: 100,
            height: 40,

            margin: EdgeInsets.only(
              left: ScreenUtil().screenWidth / 2 + 100,
              bottom: 40,
              top: ScreenUtil().screenHeight - 80,
              // right: ScreenUtil().screenWidth / 2 - 10,
            ),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.blue[900], width: 2),
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: Center(
              child: TextButton(
                onPressed:() => _jumpWelcome(),
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                       
                  //   },
                  // ));
              
                child: _islastPage
                    ? Text(
                        "立即进入",
                        style: GoogleFonts.notoSerif(
                            fontSize: 17,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "跳过",
                        style: GoogleFonts.notoSerif(
                            fontSize: 17,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _jumpWelcome() {
    SpUtil.putBool('first',true);
    String? tokenStr = SpUtil.getString("token");
    _isLogin = (tokenStr == null || tokenStr.isEmpty) ? false : true;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ),
            (route) => false);
  }
}
