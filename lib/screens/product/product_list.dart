import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/models/product/product_model.dart';
import 'package:e_commerce/screens/product/product_detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: productList.isEmpty
          ? const Center(
              child: Text("No Product Found"),
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 50),
              shrinkWrap: true,
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemBuilder: (ctx, index) {
                ProductModel product = productList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    Image.network(
                      product.image,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      product.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Price: \$${product.price}"),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 45,
                      width: 140,
                      child: OutlinedButton(
                        onPressed: () {
                          Routes.instance.push(
                              widget: ProductDetail(
                                product: product,
                              ),
                              context: context);
                        },
                        child: const Text(
                          "Buy",
                        ),
                      ),
                    )
                  ]),
                );
              }),
    );
  }
}
