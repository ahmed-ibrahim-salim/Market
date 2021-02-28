import 'package:Market/providers/product.dart';
import 'package:Market/providers/products.dart';
import 'package:Market/screens/AddOrEditProduct.dart';
import 'package:Market/widgets/myProducts.dart';
import 'package:Market/widgets/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductsScreen extends StatelessWidget {
  static const routeName = '/myproducts-screen';
  @override
  Widget build(BuildContext context) {
    final List<Product> myProducts =
        Provider.of<Products>(context).productItems.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
        centerTitle: false,
      ),
      drawer: SideDrawer(),
      body: Container(
        color: Color(0xFFededed),
        child: ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: myProducts[i],
                  child: MyProductsItemWidget(),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
