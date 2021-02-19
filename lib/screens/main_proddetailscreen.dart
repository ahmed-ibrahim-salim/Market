import 'package:Market/providers/cart.dart';
import 'package:Market/providers/product.dart';
import 'package:Market/providers/products.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdDetailScreen extends StatefulWidget {
  static const routeName = '/prod-detail-screen';

  @override
  _ProdDetailScreenState createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  Function callFavourite;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final certainProduct = Provider.of<Products>(context)
        .productItems
        .firstWhere((prod) => prod.id == productId);

    callFavourite(Product product) {
      setState(() {
        product.addProductToFavourite(product);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          certainProduct.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: Image.network(
                      certainProduct.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 5,
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(certainProduct.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () => callFavourite(certainProduct),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.add_shopping_cart),
                      color: cart.cartItems.containsKey(certainProduct.id)
                          ? Color.fromRGBO(71, 201, 71, 2)
                          : Theme.of(context).primaryColor,
                      onPressed: () {
                        cart.addItem(certainProduct.id, certainProduct.title,
                            certainProduct.price, certainProduct.imageUrl);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              certainProduct.title,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30,
              ),
            ),
            SizedBox(),
            Text(
              certainProduct.description,
            ),
          ],
        ),
      ),
    );
  }
}

// AppBar(
//         leading: new IconButton(
//             icon: new Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context, true);
//               Navigator.of(context).pushNamed(FavouritesScreen.routeName);
//             }),
//       ),
