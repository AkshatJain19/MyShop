import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final double price;
  final String title;

  final int quvantiti;
  CartTile(this.price, this.title, this.quvantiti);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor,
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '\$$price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).primaryTextTheme.headline6.color),
                ),
              ),
              fit: BoxFit.contain,
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * quvantiti}'),
          trailing: Text('$quvantiti x'),
        ),
      ),
    );
  }
}
