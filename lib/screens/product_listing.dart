import 'package:flutter/material.dart';
import 'package:mad1_shopping_3b/components/app_drawer.dart';
import 'package:mad1_shopping_3b/helpers/db_helper.dart';
import 'package:mad1_shopping_3b/models/product.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  void addItem() async {
    var product = Product(id: 1, title: 'Pouch Bag', price: 2500);
    DbHelper.insertProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ElevatedButton(
        onPressed: () async {
          //fetch data
          final query = await DbHelper.fetchRaw();
          print(query);
        },
        child: const Text('ADD'),
      ),
    );
  }
}
