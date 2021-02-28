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
                          RaisedButton.icon(
                            onPressed: () {
                              cart.addItem(product.id, product.title,
                                  product.price, product.imageUrl);
                              Scaffold.of(context).hideCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Added to cart!'),
                                duration: Duration(seconds: 2),
                              ));
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            label: cart.cartItems.containsKey(product.id)
                                ? Text('IN CART')
                                : Text('ADD TO CART'),
                            color: cart.cartItems.containsKey(product.id)
                                ? Colors.grey
                                : Color.fromRGBO(71, 201, 71, 2),
                            textColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(product.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined),
                              color: Colors.red,
                              onPressed: () {
                                product.addProductToFavourite(product);
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
