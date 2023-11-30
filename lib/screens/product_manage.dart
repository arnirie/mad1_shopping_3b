import 'package:flutter/material.dart';
import 'package:mad1_shopping_3b/components/app_drawer.dart';
import 'package:mad1_shopping_3b/helpers/db_helper.dart';
import 'package:mad1_shopping_3b/models/product.dart';

class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Prodcuts'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: DbHelper.fetch(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('not yet available');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var products = snapshot.data;
          if (products == null) {
            return const Center(
              child: Text('No Product Entries'),
            );
          }
          print(products);
          return ListView.builder(
            itemBuilder: (_, index) {
              // var product = products[index] as Product;
              var product = Product(
                id: products[index][DbHelper.colId],
                title: products[index][DbHelper.colTitle],
                price:
                    double.parse(products[index][DbHelper.colPrice].toString()),
                description: products[index][DbHelper.colDescription],
              );
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description ?? ''),
                  trailing: IconButton(
                    onPressed: () {
                      DbHelper.deleteRaw(product.id);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
