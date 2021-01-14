import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String tittle;
  double price;
  int quantity;
  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.tittle,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};
  Map<String, CartItem> get item {
    return {..._item};
  }

  void addcart(
    String productId,
    double price,
    String tittle,
  ) {
    if (_item.containsKey(productId)) {
      _item.update(
          productId,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quantity: value.quantity + 1,
              tittle: value.tittle));
    } else {
      _item.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                price: price,
                quantity: 1,
                tittle: tittle,
              ));
    }
    notifyListeners();
  }

  int get itemNO {
    return _item.length;
  }

  double get total {
    double total = 0;
    _item.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removecartitem(String productid) {
    _item.remove(productid);
    notifyListeners();
  }

  void clearcart() {
    _item = {};
    notifyListeners();
  }
}
