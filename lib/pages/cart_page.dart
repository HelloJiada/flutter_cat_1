import 'package:flutter/material.dart';
import 'package:flutter_cat_1/model/cart_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../tools/tools.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: Consumer<CarModel>(builder: (context, value, child) {
        if (value.cartItems.length == 0) {
          return Center(
            child: Text(
              "您没有选择小猫咪哦",
              style: GoogleFonts.notoSerif(
                fontSize: 30,
              ),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "我的猫",
                style: GoogleFonts.notoSerif(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  value.shopItems[index].pic,
                                  height: 36,
                                ),
                                title: Text(value.shopItems[index].name),
                                // ignore: prefer_interpolation_to_compose_strings
                                subtitle: Text('\$' + value.shopItems[index].price),
                                trailing: IconButton(
                                    onPressed: () =>
                                        Provider.of<CarModel>(context, listen: false)
                                            .removeItemFromCart(index),
                                    icon: const Icon(Icons.cancel)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '总价',
                          style: GoogleFonts.notoSerif(color: Colors.white70),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${value.clculateTotal()} 元',
                          style: GoogleFonts.notoSerif(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () => launchURL('snssdk1128://user/profile/88486395468'),
                        child: Row(children: [
                          Text(
                            '支付',
                            style: GoogleFonts.notoSerif(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
