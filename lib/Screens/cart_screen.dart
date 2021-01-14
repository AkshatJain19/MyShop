import 'package:MyShop/Widgets/cart_tile.dart';
import 'package:MyShop/providers/cart.dart';
import 'package:MyShop/providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routname = '/cart';
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.total}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false)
                          .addorder(cart.total, cart.item.values.toList());
                      cart.clearcart();
                    },
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(cart.item.values.toList()[i].id),
                background: Container(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerRight,
                  color: Theme.of(context).errorColor,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) =>
                    cart.removecartitem(cart.item.keys.toList()[i]),
                child: CartTile(
                    cart.item.values.toList()[i].price,
                    cart.item.values.toList()[i].tittle,
                    cart.item.values.toList()[i].quantity),
              ),
              itemCount: cart.item.length,
            ),
          )
        ],
      ),
    );
  }
}
