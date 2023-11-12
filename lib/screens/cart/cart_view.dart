import 'package:e_commerce/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
          itemCount: 4,
          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
          itemBuilder: (ctx, index) {
            return CartItem();
          }),
    );
  }
}
