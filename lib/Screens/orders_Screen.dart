import 'package:MyShop/Widgets/App_drawer.dart';
import 'package:MyShop/providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routename = '/Order-screen';
  @override
  Widget build(BuildContext context) {
    var _orders = Provider.of<Order>(context);
    return Scaffold( 
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: Appdrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            leading: Text('${_orders.getorder[i].total}'),
          );
        },
        itemCount: _orders.getorder.length,
      ),
    );
  }
}
