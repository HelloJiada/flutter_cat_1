import 'package:flutter/material.dart';
import 'package:flutter_cat_1/pages/home_page.dart';
import 'package:flutter_cat_1/pages/intro_page.dart';
import 'package:flutter_cat_1/pages/mine_page.dart';
import 'package:flutter_cat_1/welcome/start_page.dart';
import 'package:flutter_cat_1/welcome/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'generated/l10n.dart';
import 'model/cart_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final _pageNo =  [const HomePage(), const MinePage()];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 681),
      builder: (BuildContext context, Widget? child) => ChangeNotifierProvider(
        create: (context) => CarModel(),
        child: MaterialApp(
          locale: const Locale('zh',''),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate
          ],
          supportedLocales: [
            const Locale("zh", ''),
            const Locale("en", ''),
            ...S.delegate.supportedLocales
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: _pageNo[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              fixedColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "首页",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_circle_outlined),
                  label: "我的",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class $ {
}
