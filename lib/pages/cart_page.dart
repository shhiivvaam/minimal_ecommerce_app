import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
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
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  // user pressed the Pay Button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Sure!! Want to procced to Payments Page'),
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
              // TODO: start with the payment process
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text("Nothing here, shop now!!"),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item in cart
                      final item = cart[index];

                      // return it as a list tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
