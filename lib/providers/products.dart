import 'package:flutter/material.dart';

import 'product.dart';

class Categories with ChangeNotifier {
  List<Category> _categoryItems = [
    Category(
      catId: 'Shirts',
      title: 'Shirts',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/02/15/11/42/t-shirt-2068353_960_720.png',
    ),
    Category(
      catId: 'Pants',
      title: 'Pants',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_960_720.jpg',
    ),
    Category(
      catId: 'Scarves',
      title: 'Scarves',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083398_960_720.jpg',
    ),
    Category(
      catId: 'Kitchen',
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
      categoryId: 'Shirts',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p2',
      categoryId: 'Pants',
      title: 'jeans',
      description: 'A nice pair of jeans.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p3',
      categoryId: 'Scarves',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p4',
      categoryId: 'Kitchen',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      isFavourite: false,
    ),
    Product(
      id: 'p5',
      categoryId: 'Scarves',
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

  void addNewProduct(Product product) {
    final newProd = Product(
      id: DateTime.now().toString(),
      categoryId: product.categoryId,
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      isFavourite: false,
    );
    _productItems.insert(0, newProd);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final _prodIndex = _productItems.indexWhere((element) => element.id == id);
    _productItems[_prodIndex] = newProduct;
    notifyListeners();
  }

  void removeProduct(String id) {
    _productItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
