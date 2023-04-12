import 'package:flutter/material.dart';
import 'package:flutter_cat_1/pages/cart_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'package:flutter_cat_1/model/cart_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            })),
          backgroundColor: Colors.black,
          child: Icon(
            Icons.shopping_bag,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Good moring",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Let's order a cute kitten for you",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "A fresh Kitty",
                  style: GoogleFonts.notoSerif(
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<CarModel>(builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      padding: EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: (){
                            Provider.of<CarModel>(
                              context,listen: false
                            ).addItemToCart(index);
                          },
                        );
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
