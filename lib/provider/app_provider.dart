import 'package:e_commerce/models/product/product_model.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<ProductModel> _cartProductList = [];

  void addCartProduct(ProductModel productModel) {
    if (!_cartProductList.contains(productModel)) {
      _cartProductList.add(productModel);
      notifyListeners();
    }
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> _favoutiteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
    if (!_favoutiteProductList.contains(productModel)) {
      _favoutiteProductList.add(productModel);
      notifyListeners();
    }
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favoutiteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get cartProductList => _cartProductList;
  List<ProductModel> get favoutiteProductList => _favoutiteProductList;
}
