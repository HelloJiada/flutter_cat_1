import 'package:flutter/material.dart';

class CarModel extends ChangeNotifier {
  final List _shopItems = [
    ["ZaoShui.", "25.00", "assets/8b10de68e58cfef6bd5f22e5321537.jpg", Colors.green],
    ["ZaoQi.", "25.00", "assets/cat.jpg", Colors.yellow],
    ["Pupu.", "30.00", "assets/503421681131239_.jpg", Colors.orange],
    ["Piupiu.", "10.00", "assets/503471681132990_.jpg", Colors.tealAccent],
    ["XiaoXin.", "10.00", "assets/497401681033126_.jpg", Colors.amberAccent],
    ["QiuQiu.", "10.00", "assets/503351681128814_.jpg", Colors.deepOrange],
  ];

List cartItems = [];

  get shopItems => _shopItems;

  void addItemToCart(int index) {
    cartItems.add(shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String clculateTotal() {
    double totalPrice = 0;
    for (var i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
  
}
  