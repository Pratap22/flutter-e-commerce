import 'package:e_commerce/models/product/product_model.dart';
import 'package:e_commerce/provider/app_provider.dart';
import 'package:e_commerce/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> cartProductList =
        Provider.of<AppProvider>(context).cartProductList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartProductList.length < 1
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: cartProductList.length,
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              itemBuilder: (ctx, index) {
                return CartItem(
                  product: cartProductList[index],
                );
              }),
    );
  }
}
