// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_cat_1/model/cat_data.dart';
import 'package:flutter_cat_1/pages/cart_page.dart';
import 'package:flutter_cat_1/pages/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final int id;
  final List<String> contextList;
  final color;
  void Function()? onPressed;

  CatData catData;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    required this.id,
    required this.contextList,
    required this.catData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsScreen(
              catData: catData,
            );
          })),
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: catData.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  itemName,
                  style: GoogleFonts.notoSerif(fontSize: 20),
                ),
                MaterialButton(
                  onPressed: onPressed,
                  color: color,
                  child: Text(
                    '$itemPrice 元',
                    style: GoogleFonts.notoSerif(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: ScaleAnimatedTextKit(
                    totalRepeatCount: 99999,
                    text: contextList,
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                    // alignment:AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
