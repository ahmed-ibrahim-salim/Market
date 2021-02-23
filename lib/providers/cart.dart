import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String itemName;
  int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    @required this.id,
    @required this.itemName,
    @required this.quantity,
    @required this.price,
    @required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  void addItem(String prodId, String title, double price, String imageUrl) {
    if (_cartItems.containsKey(prodId)) {
      _cartItems.update(
          prodId,
          (oldCartItem) => CartItem(
                id: oldCartItem.id,
                itemName: oldCartItem.itemName,
                quantity: oldCartItem.quantity + 1,
                price: oldCartItem.price,
                imageUrl: oldCartItem.imageUrl,
              ));
    } else {
      _cartItems.putIfAbsent(
        prodId,
        () => CartItem(
            id: DateTime.now().toString(),
            itemName: title,
            quantity: 1,
            price: price,
            imageUrl: imageUrl),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    final a = cartItems.entries.firstWhere((element) => element.value.id == id);
    _cartItems.remove(a.key);
    notifyListeners();
  }

  void increaseQuantity(CartItem carItem) {
    carItem.quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity(CartItem carItem, int quantity) {
    if (quantity < 1) {
      return;
    } else {
      carItem.quantity -= 1;
      notifyListeners();
    }
  }
}
