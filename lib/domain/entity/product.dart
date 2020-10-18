import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    this.name,
    this.price,
    this.imageUrl,
  });

  @override
  List<Object> get props => [name, price, imageUrl];
}
