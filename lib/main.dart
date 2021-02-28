import 'package:Market/providers/cart.dart';
import 'package:Market/screens/AddOrEditProduct.dart';
import 'package:Market/screens/MyproductsScreen.dart';

import './providers/product.dart';
import './screens/CartScreen.dart';
import './screens/fromfavproddetail.dart';
import 'package:provider/provider.dart';

import './screens/tabsScreen.dart';
import 'package:flutter/material.dart';

import './providers/products.dart';
import 'screens/productsbycat.dart';
import 'screens/main_proddetailscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Product(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TabsScreen(),
        routes: {
          CategoryItemsScreen.routeName: (ctx) => CategoryItemsScreen(),
          ProdDetailScreen.routeName: (ctx) => ProdDetailScreen(),
          FromFavProdDetailScreen.routeName: (ctx) => FromFavProdDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          MyProductsScreen.routeName: (ctx) => MyProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
