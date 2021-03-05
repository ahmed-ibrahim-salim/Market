import 'package:Market/screens/fromfavproddetail.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteItemsWidget extends StatefulWidget {
  @override
  _FavouriteItemsWidgetState createState() => _FavouriteItemsWidgetState();
}

class _FavouriteItemsWidgetState extends State<FavouriteItemsWidget> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FromFavProdDetailScreen.routeName,
            arguments: product.id);
        print(product.id);
      },
      child: Card(
        elevation: 5,
        child: GridTile(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.39,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Image.network(
                  product.imageUrl,
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
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${product.price.toString()}\$',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              cart.addItem(product.id, product.title,
                                  product.price, product.imageUrl);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              // Scaffold.of(context)..hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Added to cart!'),
                                duration: Duration(seconds: 2),
                              ));
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            label: cart.cartItems.containsKey(product.id)
                                ? Text('IN CART')
                                : Text('ADD TO CART'),
                            style: ElevatedButton.styleFrom(
                                primary: cart.cartItems.containsKey(product.id)
                                    ? Colors.grey
                                    : Color.fromRGBO(71, 201, 71, 2),
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                          // color: cart.cartItems.containsKey(product.id)
                          //     ? Colors.grey
                          //     : Color.fromRGBO(71, 201, 71, 2),

                          IconButton(
                              icon: Icon(product.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined),
                              color: Colors.red,
                              onPressed: () {
                                product.addProductToFavourite(product);
                                // Scaffold.of(context).hideCurrentSnackBar();
                                product.isFavourite
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        SnackBar(
                                          content: Text('Added to favourites!'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      )
                                    : null;
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
