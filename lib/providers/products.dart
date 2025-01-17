import 'package:flutter/material.dart';

class ProductsModel with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  ProductsModel(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});
  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
