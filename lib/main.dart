import 'package:flutter/material.dart';
import 'package:flutter_cat_1/pages/intro_page.dart';
import 'package:provider/provider.dart';

import 'model/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CarModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntroPage(),
      ),
    );
  }
}

