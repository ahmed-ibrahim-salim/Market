import 'package:Market/screens/fromfavproddetail.dart';

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
                        product.price.toString(),
                      ),
                      Row(
                        children: [
                          RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text('ADD TO CART'),
                            color: Color.fromRGBO(71, 201, 71, 2),
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