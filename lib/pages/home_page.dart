import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_cat_1/generated/l10n.dart';
import 'package:flutter_cat_1/pages/cart_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import 'package:flutter_cat_1/model/cart_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'cat_more_page.dart';
import 'drawer_page.dart';
import 'message_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).Catsgrocerystore,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              S.load(
                Locale('en', ""),
              );
            },
            icon: Icon(
              Icons.language,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MessagePage();
                  },
                ));
              },
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CartPage();
          })),
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.shopping_bag,
          ),
        ),
        drawer: const DrawerPage(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "抖音商城搜索 - ",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "早睡早起的猫咪小铺子",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      hintText: "搜索 小猫咪",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.search),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 25,
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return CatMorePage();
                                },
                              ));
                            },
                            child: Icon(Icons.ads_click_sharp),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber[800]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "挑选一只可爱的小猫吧",
                  style: GoogleFonts.notoSerif(
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<CarModel>(builder: (context, value, child) {
                  return AnimationLimiter(
                    child: GridView.builder(
                        itemCount: value.shopItems.length,
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: value.shopItems.length,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: GroceryItemTile(
                                  catData: value.shopItems[index],
                                  itemName: value.shopItems[index].name,
                                  itemPrice: value.shopItems[index].price,
                                  imagePath: value.shopItems[index].pic,
                                  color: value.shopItems[index].color,
                                  id: value.shopItems[index].id,
                                  contextList: value.shopItems[index].desList,
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: "添加成功",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black45,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    Provider.of<CarModel>(context,
                                            listen: false)
                                        .addItemToCart(index);
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
  borderSide: BorderSide.none,
);
