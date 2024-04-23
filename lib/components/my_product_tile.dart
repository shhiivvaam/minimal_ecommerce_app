import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to confirm to -> add to Cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Add this item to your cart?'),
        actions: [
          // cancel buttom
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // yes -> confirm buttom
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);
              // add to cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product image
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(product.imagePath)),
              ),
              const SizedBox(height: 25),

              // product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price
              Text('\$${product.price.toStringAsFixed(2)}'),

              // add to the cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
