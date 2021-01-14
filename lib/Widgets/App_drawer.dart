import 'package:MyShop/Screens/orders_Screen.dart';
import 'package:flutter/material.dart';

class Appdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hey'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Your Orders'),
            onTap: () {
              Navigator.pushNamed(context, OrdersScreen.routename);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text('Shop'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
