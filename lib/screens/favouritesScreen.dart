import 'package:Market/providers/products.dart';
import 'package:Market/screens/CartScreen.dart';

import '../widgets/favouriteItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    final products = Provider.of<Products>(context);
    final favouritesList =
        products.productItems.where((element) => element.isFavourite).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
        ],
      ),
      body: favouritesList.isEmpty
          ? Center(
              child: Text(
              'Nothing Here',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
          : Container(
              color: Color(0xFFededed),
              child: GridView.builder(
                itemCount: favouritesList.length,
                padding: EdgeInsets.all(4),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 3,
                  childAspectRatio: 2 / 1.2,
                ),
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: favouritesList[i],
                  child: FavouriteItemsWidget(),
                ),
              ),
            ),
    );
  }
}
