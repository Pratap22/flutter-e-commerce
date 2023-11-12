import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel(
      {required this.image,
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      this.quantity});

  String image;
  String id;
  String name;
  double price;
  String description;

  int? quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        quantity: json["quantity"],
        price: double.parse(json["price"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "quantity": quantity
      };
  ProductModel copyWith({
    int? quantity,
  }) =>
      ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        quantity: quantity ?? this.quantity,
        price: price,
      );
}