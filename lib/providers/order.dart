import 'package:MyShop/providers/cart.dart';
import 'package:flutter/material.dart';

class Orderitems {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime dateTime;
  Orderitems(this.id, this.total, this.products, this.dateTime);
}

class Order with ChangeNotifier {
  List<Orderitems> _orderlist = [];
  List<Orderitems> get getorder {
    return [..._orderlist];
  }

  void addorder(double total, List<CartItem> products) {
    _orderlist.insert(0,
        Orderitems(DateTime.now().toString(), total, products, DateTime.now()));
    notifyListeners();
  }
}
