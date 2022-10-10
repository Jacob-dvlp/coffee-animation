import 'package:coffe_animation/constantes/images_const.dart';
import 'package:flutter/cupertino.dart';

List<Coffee> coffee = [
  Coffee(name: 'Caramel Macchiato', img: image1, price: 35),
  Coffee(name: 'DrinkCaramel Cold Drink', img: image2, price: 6.0),
  Coffee(name: 'Toffee', img: image3, price: 8.0),
  Coffee(name: 'Capuchino', img: image4, price: 3.0),
  Coffee(name: 'Americano', img: image5, price: 9.0),
  Coffee(name: 'Vietnamese', img: image6, price: 5.0),
  Coffee(name: 'Black Tea Latte', img: image7, price: 5.0),
  Coffee(name: 'Classic Tea Latte', img: image8, price: 12.0),
  Coffee(name: 'Latte', img: image9, price: 20.0),
  Coffee(name: 'Milk', img: image10, price: 25.0),
  Coffee(name: 'Milk 2', img: image11, price: 2.0),
  Coffee(name: 'Milk 3', img: image12, price: 1.0),
];

class Coffee {
  final String? name;
  final String? img;
  final double? price;

  Coffee({@required this.name, @required this.img, @required this.price});
}
