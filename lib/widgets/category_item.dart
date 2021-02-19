import 'package:Market/providers/product.dart';

import '../screens/productsbycat.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryItemsScreen.routeName,
          arguments: CategoryArguments(id, title),
        );
      },
      child: Card(
        elevation: 5,
        child: GridTile(
          header: GridTileBar(
            backgroundColor: Colors.white,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
