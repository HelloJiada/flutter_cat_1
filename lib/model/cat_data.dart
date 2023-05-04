import 'package:flutter/material.dart';

class CatData {
  final String pic;
  final String name;
  final String price;
  final String context;
  final List<String>desList;
  final String variety;
  final String size;
  final Color color;
  final int id;

  CatData({
    required this.pic,
    required this.name,
    required this.price,
    required this.context,
    required this.color,
    required this.desList,
    required this.variety,
    required this.size,
    required this.id,
  });
}
