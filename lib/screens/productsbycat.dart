import 'package:Market/providers/products.dart';
import 'package:Market/screens/CartScreen.dart';

import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class CategoryItemsScreen extends StatelessWidget {
  static const routeName = '/category-items';

  @override
  Widget build(BuildContext context) {
    final CategoryArguments categoryArgs =
        ModalRoute.of(context).settings.arguments;

    final List<Product> filteredByCat = Provider.of<Products>(context)
        .productItems
        .where((prod) => prod.categoryId == categoryArgs.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryArgs.title),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
        ],
      ),
      body: Container(
        color: Color(0xFFededed),
        child: GridView.builder(
          itemCount: filteredByCat.length,
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 3,
            childAspectRatio: 2 / 1.2,
          ),
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: filteredByCat[i],
            child: ProductItem(),
          ),
        ),
      ),
    );
  }
}
