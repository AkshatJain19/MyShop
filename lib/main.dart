import 'package:MyShop/Screens/Products_Details_screen.dart';
import 'package:MyShop/Screens/cart_screen.dart';
import 'package:MyShop/Screens/orders_Screen.dart';
import 'package:MyShop/Widgets/App_drawer.dart';
import 'package:MyShop/Widgets/ProductsGrid.dart';
import 'package:MyShop/Widgets/badge.dart';
import 'package:MyShop/providers/cart.dart';
import 'package:MyShop/providers/order.dart';
import 'package:MyShop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Productsprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        )
      ],
      child: MaterialApp(
        title: 'Myshop',
        home: Product(),
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        routes: {
          ProductsDetails.route: (ctx) => ProductsDetails(),
          CartScreen.routname: (ctx) => CartScreen(),
          OrdersScreen.routename: (ctx) => OrdersScreen()
        },
      ),
    ),
  );
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool favtoggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == 0) {
                  favtoggle = true;
                } else {
                  favtoggle = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('All Products'),
                value: 1,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(child: ch, value: cart.itemNO.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routname),
            ),
          )
        ],
      ),
      body: ProductsGrid(favtoggle),
      drawer: Appdrawer(),
    );
  }
}
