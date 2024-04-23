import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Watch",
      price: 99.9,
      description: "Nice and Cool Watch",
      imagePath: 'assets/glasses.png'),
    // product 2
    Product(
      name: "Hoodie",
      price: 199.9,
      description: "Nice and Cool Hoodie",
      imagePath: 'assets/hoodie.png',
    ),
    // product 3
    Product(
      name: "Glasses",
      price: 299.9,
      description: "Nice and cool Glasses",
      imagePath: 'assets/watch.png',
    ),
    // product 4
    Product(
      name: "Shoes",
      price: 399.9,
      description: "Nice and cool Shoes",
      imagePath: 'assets/shoes.png',
    ),
    // product 5
    Product(
      name: "Watch",
      price: 499.9,
      description: "Nice and Cool Watch",
      imagePath: 'assets/glasses.png',
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get Product List
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add items to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remoce items from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
