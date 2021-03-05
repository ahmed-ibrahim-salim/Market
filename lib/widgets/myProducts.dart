import 'package:Market/providers/product.dart';
import 'package:Market/providers/products.dart';
import 'package:Market/screens/AddOrEditProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductsItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final products = Provider.of<Products>(context);
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(product.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      arguments: product.id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  products.removeProduct(product.id);
                },
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
