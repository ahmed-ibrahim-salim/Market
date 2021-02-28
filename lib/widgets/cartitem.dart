import 'package:Market/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem1 = Provider.of<CartItem>(context);

    return Card(
      elevation: 5,
      child: GridTile(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.39,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Image.network(
                cartItem1.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 5, left: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      cartItem1.itemName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${cartItem1.price.toString()}\$',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(width: 0.8, color: Colors.black54),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    cart.decreaseQuantity(
                                        cartItem1, cartItem1.quantity);
                                  },
                                  child: Text('-'),
                                ),
                                Text(cartItem1.quantity.toString()),
                                GestureDetector(
                                  onTap: () => cart.increaseQuantity(cartItem1),
                                  child: Text('+'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            cart.removeItem(cartItem1.id);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
