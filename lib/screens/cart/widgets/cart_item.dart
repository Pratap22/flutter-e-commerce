import 'package:e_commerce/constants/asset_images.dart';
import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/models/product/product_model.dart';
import 'package:e_commerce/provider/app_provider.dart';
import 'package:e_commerce/widgets/quantity_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final ProductModel product;
  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

   @override
  void initState() {
    setState(() {
      quantity = widget.product.quantity ?? quantity;
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
                child: Image.network(
              widget.product.image,
              height: 140,
            )),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  widget.product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              QuantityCounter(
                                  quantity: quantity,
                                  onMinus: () {
                                    if (quantity > 0) {
                                      quantity--;
                                    }
                                  },
                                  onPlus: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  }),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Text(
                                  "Add to wishlist",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$${widget.product.price.toString()}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Provider.of<AppProvider>(context, listen: false)
                                .removeCartProduct(widget.product);
                                showMessage("Removed from Cart");
                          },
                          child: const CircleAvatar(
                            maxRadius: 13,
                            child: Icon(
                              Icons.delete,
                              size: 17,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
