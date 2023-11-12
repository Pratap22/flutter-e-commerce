import 'package:e_commerce/constants/asset_images.dart';
import 'package:e_commerce/widgets/quantity_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              AssetsImages.instance.welcomeImage,
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
                                  "Banana",
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
                            "\$10",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
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
