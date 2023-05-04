import 'package:flutter/material.dart';
import 'package:flutter_cat_1/model/cat_data.dart';
import '../model/cart_model.dart';
import 'package:like_button/like_button.dart';
import 'package:photo_view/photo_view.dart';
class Body extends StatelessWidget {
  CatData catData;
  Body({super.key, required this.catData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "品种\n",
                                    ),
                                    TextSpan(
                                      text: catData.variety,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "大小\n",
                                    ),
                                    TextSpan(
                                      text: catData.size,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          catData.context,
                          style: TextStyle(
                              color: Colors.white, fontSize: 17, height: 1.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LikeButton(
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Container(
                      //       padding: EdgeInsets.all(0),
                      //       height: 40,
                      //       width: 40,
                      //       decoration: BoxDecoration(
                      //         color: Colors.red,
                      //         shape: BoxShape.circle,
                      //       ),
                      //       child: Icon(Icons.volunteer_activism_outlined,color: Colors.white,),
                      //     ),
                      //   ],
                      // ),
                      // Stack(
                      //   alignment: Alignment.center,
                      //   children: <Widget>[
                      //     CustomPaint(
                      //       size: Size(50, 50),
                      //       painter: dotpainter,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // SizedBox(width: 50,),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  color: Colors.white,
                                  child: Text(
                                    "下单",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "抖音商城搜索#早睡早起的猫咪小铺子",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        catData.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "价格\n",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: catData.price,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                tag: catData.id,
                                child: Image.asset(
                                  catData.pic,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
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
}
