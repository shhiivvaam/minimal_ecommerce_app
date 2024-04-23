import "package:flutter/material.dart";
import "package:minimal_ecommerce_app/components/my_list_tile.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // shop title

              // Shop Button
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                // pop the drawer
                onTap: () => Navigator.pop(context),
              ),
              // Cart Button
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop the drawer first
                  Navigator.pop(context);
                  // then navigate to the cart page
                  Navigator.pushNamed(context, "/cart_page");
                },
              ),
            ],
          ),
          // Exit Button -> Logout
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),

          // cart title

          // exit shop tile
        ],
      ),
    );
  }
}
