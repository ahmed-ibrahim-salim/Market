import 'package:Market/providers/cart.dart';
import 'package:Market/providers/products.dart';
import 'package:Market/screens/CartScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FromFavProdDetailScreen extends StatefulWidget {
  static const routeName = '/fromfav-prod-detail-screen';

  @override
  _FromFavProdDetailScreenState createState() =>
      _FromFavProdDetailScreenState();
}

class _FromFavProdDetailScreenState extends State<FromFavProdDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final certainProduct = Provider.of<Products>(context)
        .productItems
        .firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          certainProduct.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
        ],
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
                  // Positioned(
                  //   bottom: 50,
                  //   right: 5,
                  //   child: IconButton(
                  //     iconSize: 30,
                  //     icon: Icon(certainProduct.isFavourite
                  //         ? Icons.favorite
                  //         : Icons.favorite_border),
                  //     color: Colors.red,
                  //     onPressed: () => callFavourite(certainProduct),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.shopping_cart_outlined),
                      color: Theme.of(context).primaryColor,
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
