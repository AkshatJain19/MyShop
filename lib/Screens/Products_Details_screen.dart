import 'package:MyShop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDetails extends StatelessWidget {
  static const String route = '/Products-Details';
  @override
  Widget build(BuildContext context) {
    String _id = ModalRoute.of(context).settings.arguments as String;
    var _items = Provider.of<Productsprovider>(context)
        .items
        .firstWhere((element) => element.id == _id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_items.title),
      ),
    );
  }
}
