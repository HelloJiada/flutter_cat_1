// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_cat_1/model/cat_data.dart';
import 'package:flutter_cat_1/pages/body.dart';
import 'package:flutter_cat_1/pages/cart_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../tools/tools.dart';

import '../model/cart_model.dart';

class DetailsScreen extends StatelessWidget {
  CatData catData;
 DetailsScreen({super.key, required this.catData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
              // onPressed: () =>
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return const CartPage();
              //     })),
              onPressed: () => launchURL('snssdk1128://user/profile/88486395468'),
              icon: Icon(
                Icons.app_shortcut_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: Body(
        catData: catData,
      ),
    );
  }
}



