import 'package:MyShop/Screens/Products_Details_screen.dart';

import 'package:MyShop/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _items = Provider.of<ProductsModel>(context);
    var cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          return Navigator.pushNamed(context, ProductsDetails.route,
              arguments: _items.id);
        },
        child: Image.network(
          _items.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          _items.title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(_items.isFavorite == true
              ? Icons.favorite
              : Icons.favorite_border),
          onPressed: _items.toggleFavorite,
          color: Theme.of(context).accentColor,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => cart.addcart(_items.id, _items.price, _items.title),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
