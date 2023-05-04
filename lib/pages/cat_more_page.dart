import 'dart:ffi';

// import 'package:html/dom.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../model/story_model.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/src/widgets/text.dart';
import 'package:html/dom_parsing.dart';

class CatMorePage extends StatefulWidget {
  const CatMorePage({super.key});

  @override
  State<CatMorePage> createState() => _CatMorePageState();
}

class _CatMorePageState extends State<CatMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("猫咪品种大全"),
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1/1, crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: 100,
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        alignment: Alignment.center,
                        child: Text("1"),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
