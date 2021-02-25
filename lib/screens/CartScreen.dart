import 'package:Market/providers/cart.dart';
import 'package:Market/widgets/cartitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.cartItems.values.toList();
    
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(71, 201, 71, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'total',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Color(0xFFededed),
        child: GridView.builder(
          itemCount: cartItems.length,
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 3,
            childAspectRatio: 2.5 / 1,
          ),
          itemBuilder: ((ctx, i) => ChangeNotifierProvider.value(
                value: cartItems[i],
                child: CartItemsWidget(),
              )),
        ),
      ),
    );
  }
}
