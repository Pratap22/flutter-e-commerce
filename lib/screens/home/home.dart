import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/helpers/firebase_firestore.dart';
import 'package:e_commerce/models/category/category_model.dart';
import 'package:e_commerce/models/product/product_model.dart';
import 'package:e_commerce/screens/category/category_view.dart';
import 'package:e_commerce/screens/product/product_list.dart';
import 'package:e_commerce/widgets/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productList = await FirebaseFirestoreHelper.instance.getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopTitle(title: "LWP - e-Commerce", subTitle: ""),
                          const TextField(
                            decoration:
                                InputDecoration(hintText: "Search ...."),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    categoriesList.isEmpty
                        ? const Center(
                            child: Text("Categories is empty"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoriesList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Routes.instance.push(
                                              widget: CategoryView(
                                                  categoryModel: e),
                                              context: context);
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(e.image),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12, left: 12),
                      child: Text(
                        "Best Selling",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ProductList(productList: productList)
                  ]),
            ),
    );
  }
}
