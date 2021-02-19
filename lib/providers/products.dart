import 'package:flutter/material.dart';

import 'product.dart';

class Categories with ChangeNotifier {
  List<Category> _categoryItems = [
    Category(
      catId: '1',
      title: 'Shirts',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/02/15/11/42/t-shirt-2068353_960_720.png',
    ),
    Category(
      catId: '2',
      title: 'Pants',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_960_720.jpg',
    ),
    Category(
      catId: '3',
      title: 'Scarves',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083398_960_720.jpg',
    ),
    Category(
      catId: '4',
      title: 'Kitchen',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/10/26/07/21/soup-1006694_960_720.jpg',
    ),
  ];

  List<Category> get categoryItems {
    return [..._categoryItems];
  }
}

class Products with ChangeNotifier {
  List<Product> _productItems = [
    Product(
      id: 'p1',
      categoryId: '1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p2',
      categoryId: '2',
      title: 'jeans',
      description: 'A nice pair of jeans.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p3',
      categoryId: '3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p4',
      categoryId: '4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p5',
      categoryId: '3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      isFavourite: false,
    ),
  ];

  List<Product> get productItems {
    return [..._productItems];
  }
}
