import 'dart:convert';

import 'package:product_test/domain/entity/product.dart';

class ProductModel extends Product {
  final String name;
  final double price;
  final String imageUrl;
  ProductModel({
    this.name,
    this.price,
    this.imageUrl,
  }) : super(
          name: name,
          price: price,
          imageUrl: imageUrl,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModel(
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  static List<ProductModel> fromJsonStringList(String jsonStringList) =>
      List<ProductModel>.from(
        (json.decode(jsonStringList) as List).map(
          (e) => ProductModel.fromMap(e),
        ),
      );
}
