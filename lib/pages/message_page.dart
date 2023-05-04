// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "消息",
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                print("value = $value");
              });
            },
            icon: Icon(Icons.settings),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem(
                child: Text("全部已读"),
              ),
              PopupMenuItem(
                child: Text("接受但不提醒"),
              ),
              PopupMenuItem(
                child: Text("接受并且提醒"),
              ),
            ],
          )
        ],
      ),

      body: AnimationLimiter(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.blue,
                    height: 64,
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
