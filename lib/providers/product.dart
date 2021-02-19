import 'package:flutter/foundation.dart';

class Category {
  final String catId;
  final String title;
  final String imageUrl;

  Category({
    @required this.catId,
    @required this.title,
    @required this.imageUrl,
  });
}

class Product with ChangeNotifier {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    this.id,
    this.categoryId,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavourite,
  });
  void addProductToFavourite(Product prod) {
    prod.isFavourite = !prod.isFavourite;
    notifyListeners();
  }
}

class CategoryArguments {
  final String id;
  final String title;

  CategoryArguments(
    this.id,
    this.title,
  );
}
