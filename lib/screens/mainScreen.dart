import 'package:Market/screens/CartScreen.dart';
import '../widgets/sideDrawer.dart';

import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categoryItems = categoriesData.categoryItems;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('My Shop'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
        ],
      ),
      drawer: SideDrawer(),
      body: Container(
        color: Color(0xFFededed),
        child: GridView.builder(
          itemCount: categoryItems.length,
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 2.2 / 3,
          ),
          itemBuilder: (ctx, i) => CategoryItem(categoryItems[i].catId,
              categoryItems[i].title, categoryItems[i].imageUrl),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
