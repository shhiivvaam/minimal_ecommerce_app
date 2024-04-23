import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Product 1",
      price: 99.9,
      description: "Product 1 Description",
    ),
    // product 2
    Product(
      name: "Product 2",
      price: 199.9,
      description: "Product 2 Description",
    ),
    // product 3
    Product(
      name: "Product 3",
      price: 299.9,
      description: "Product 3 Description",
    ),
    // product 4
    Product(
      name: "Product 4",
      price: 399.9,
      description: "Product 4 Description",
    ),
    // product 5
    Product(
      name: "Product 5",
      price: 499.9,
      description: "Product 5 Description",
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get Product List
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => cart;

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
