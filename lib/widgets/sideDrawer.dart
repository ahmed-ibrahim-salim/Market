import 'package:Market/screens/MyproductsScreen.dart';
import 'package:Market/screens/productsbycat.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Username'),
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(MyProductsScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
