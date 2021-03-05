import 'package:Market/providers/cart.dart';
import 'package:Market/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/main_proddetailscreen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    callFavourite(Product product) {
      product.addProductToFavourite(product);
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProdDetailScreen.routeName, arguments: product.id);
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
                                textStyle: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                          IconButton(
                            icon: Icon(product.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                            color: Colors.red,
                            onPressed: () {
                              callFavourite(product);
                              product.isFavourite
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Added to favourites!'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    )
                                  : null;
                            },
                          ),
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
