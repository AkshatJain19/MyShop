import 'package:MyShop/Widgets/product_view.dart';
import 'package:MyShop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  bool favtoggle = false;
  ProductsGrid(this.favtoggle);
  @override
  Widget build(BuildContext context) {
    var productslist = Provider.of<Productsprovider>(context);
    var _items = favtoggle ? productslist.favorite : productslist.items;
    return GridView.builder(
      itemCount: _items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: _items[index],
        child: ProductTile(),
      ),
    );
  }
}
