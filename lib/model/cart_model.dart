import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cat_1/model/cat_data.dart';

class CarModel extends ChangeNotifier {
  final List<CatData> _shopItems = [
    CatData(
      pic: "assets/8b10de68e58cfef6bd5f22e5321537.jpg",
      name: "早睡.",
      price: "5000.00",
      context: "小猫有一对透亮灵活的大眼睛，黑黑的瞳仁还会变：早晨，像枣核；中午，就成了细线；夜里，却变成两只绿灯泡，圆溜溜的，闪闪发光.",
      color: getColor(),
      desList: ["憨态可掬", "精灵善变","强烈推荐!!!"],
      variety: "布偶",
      size: "M",
      id: 1,
    ),
    CatData(
      pic: "assets/cat.jpg",
      name: "早起.",
      price: "4800.00",
      context: "小猫“咪咪”的那一双尖耳朵，一天到晚都直竖着，哪个地方有声音，马上往哪边转，活像一架性能超强的雷达.",
      color: getColor(),
      desList: ["小巧珑玲", "灵巧灵敏", "胖乎乎", "懒洋洋", "强烈推荐!!!"],
      variety: "金点长毛",
      size: "S",
      id: 2,
    ),
    CatData(
      pic: "assets/497401681033126_.jpg",
      name: "小新.",
      price: "4000.00",
      context:
          "小猫咪披着一件黑白相间的大衣，它有一双灵敏的耳朵，还有一对水汪汪的大眼睛。它脚下有厚厚的肉垫子，走路静悄悄的，老鼠见了都怕它.",
      color: getColor(),
      desList: ["摇头摆尾", "贪吃好睡", "强烈推荐!!!"],
      variety: "加菲猫",
      size: "S",
      id: 3,
    ),
    CatData(
      pic: "assets/503351681128814_.jpg",
      name: "丘丘.",
      price: "3800.00",
      context:
          "这只小猫长着一身又白又长的毛，在它圆圆的小脑袋上，长着一对小尖塔似的耳朵。耳朵的下方是一对透亮的大眼睛，黑黑的瞳仁还会变；早晨像枣核；中午就变成了细线；夜里却变成了两只绿灯泡，圆溜溜的，闪闪发亮.",
      color: getColor(),
      desList: ["摇头摆尾", "会变成狮子", "左右摇摆", "强烈推荐!!!"],
      variety: "缅因猫",
      size: "S",
      id: 4,
    ),
    CatData(
      pic: "assets/503471681132990_.jpg",
      name: "PipPiu.",
      price: "9800.00",
      context:
          "蜷缩在椅子下的大猫浑身雪白，它懒懒的样子实在可爱至极。五月的阳光照到椅子下面，他起了身，茸茸的脚垫向前一搭，夸张至极地伸了一个懒腰，眯眯的眼神一下子透出了灵光，一声足以让他主人牵肠的叫声实在是太甜了.",
      color: getColor(),
      desList: ["摇头摆尾", "笨拙", "晶莹", "强烈推荐!!!"],
      variety: "缅因猫",
      size: "L",
      id: 5,
    ),
    CatData(
      pic: "assets/515741681379126_.pic_hd.jpg",
      name: "豆豆.",
      price: "2500.00",
      context:
          "每当夜幕降临,小花猫就显得特别精神,它瞪着圆圆的大眼睛守在老鼠家的门口静静地等待着,一有目标出现,小猫会一下子扑过去死死地捉住,然后美餐一顿.",
      color: getColor(),
      desList: ["活泼可爱", "会变成老虎", "强烈推荐!!!"],
      variety: "英短",
      size: "M",
      id: 6,
    ),
    CatData(
      pic: "assets/531771681712308_.pic.jpg",
      name: "普普.",
      price: "2500.00",
      context:
          "小猫玩的时候，我用一根细竹条和细绳在地上拖来拖去。小猫看见了缩起身体。当细绳在它的眼前时，它突然把细绳按住。细绳不动时，小猫死死地把它按在爪下。细绳移动时，小猫也跟随移动，紧追不放，它聚精会神的样子太好玩了.",
      color: getColor(),
      desList: ["可怜相", "懒洋洋", "强烈推荐!!!"],
      variety: "加菲",
      size: "M",
      id: 7,
    ),
    CatData(
      pic: "assets/580451681999983_.pic.jpg",
      name: "海盗头.",
      price: "3000.00",
      context:
          "小猫喜欢啃鞋子，还喜欢钻到鞋子里睡觉。它只要一看到鞋子，就会试着把头钻进去，钻不进去怎么办？啃！啃了又钻，于是，小猫反反复复的啃，反反复复地钻，一只鞋子就这样被小猫啃烂了。你瞧，我们家的鞋柜到处都是它的杰作.",
      color: getColor(),
      desList: ["毛茸茸", "会变成海贼王", "强烈推荐!!!"],
      variety: "",
      size: "M",
      id: 8,
    ),
    CatData(
      pic: "assets/590601682078349_.pic_hd.jpg",
      name: "Dimo.",
      price: "4800.00",
      context:
          "小花猫早上起来先伸一下懒腰，然后再坐起来，用两只前爪在舌尖上舔一点唾沫，像人一样地洗着脸，再用舌头不停地舔着自己的毛皮，直到有一点光亮为止.",
      color: getColor(),
      desList: ["小耳朵", "毛茸茸", "胖乎乎", "强烈推荐!!!"],
      variety: "缅因猫",
      size: "M",
      id: 9,
    ),
  ];

  List<CatData> cartItems = [];

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
      totalPrice += double.parse(cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

Color getColor() {
  return Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 0.8);
}
