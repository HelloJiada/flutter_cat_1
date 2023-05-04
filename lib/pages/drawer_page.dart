import 'package:flutter/material.dart';
import 'package:flutter_cat_1/welcome/start_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 300,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("铲屎官铲屎官铲屎官"),
                accountEmail: Text("饲养员饲养员饲养员"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/IMG_9406.png"),
                ),
                arrowColor: Colors.red,
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(10, 10),
                      blurRadius: 45,
                      spreadRadius: 0.0,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/IMG_0259.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  children: <Widget>[
                    ListTile(
                      title: Text('个人中心'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('我的小猫咪'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("我的订单"),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("关于我们"),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                      builder: (context) {
                        return StartPage();
                      },
                    ), (route) => false),
                    child: MenuItemButton(
                        child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.power_settings_new_outlined,
                          color: Colors.red,
                        ),
                        Text(
                          "退出登录",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
