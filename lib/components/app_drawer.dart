import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad1_shopping_3b/screens/product_listing.dart';
import 'package:mad1_shopping_3b/screens/product_manage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                'Shopping 3B',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                    builder: (_) => const ProductListingScreen())),
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                    builder: (_) => const ProductManagementScreen())),
            leading: const Icon(Icons.grid_view),
            title: const Text('Manage Products'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
