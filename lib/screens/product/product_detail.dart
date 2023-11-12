import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/models/product/product_model.dart';
import 'package:e_commerce/provider/app_provider.dart';
import 'package:e_commerce/screens/cart/cart_view.dart';
import 'package:e_commerce/widgets/quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Routes.instance.push(widget: CartView(), context: context);
            },
            icon: const Icon(Icons.shopping_cart_outlined))
      ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              widget.product.image,
              height: 350,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline))
              ],
            ),
            Text(widget.product.description),
            const SizedBox(
              height: 12,
            ),
            QuantityCounter(
              quantity: quantity,
              onMinus: () {
                setState(() {
                  if (quantity > 0) {
                    quantity--;
                  }
                });
              },
              onPlus: () {
                setState(() {
                  quantity++;
                });
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ProductModel productModel =
                        widget.product.copyWith(quantity: quantity);
                    Provider.of<AppProvider>(context, listen: false)
                        .addCartProduct(productModel);
                    showMessage("Added to Cart");
                  },
                  child: const Text("ADD TO CART"),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                SizedBox(
                  height: 38,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("BUY"),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
