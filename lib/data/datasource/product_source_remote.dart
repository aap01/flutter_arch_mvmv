import 'package:flutter/services.dart';
import 'package:product_test/data/model/product_model.dart';

abstract class ProductSourceRemote {
  Future<List<ProductModel>> fetchAll();
}

class FakeProductSourceRemoteImpl implements ProductSourceRemote {
  @override
  Future<List<ProductModel>> fetchAll() async {
    await Future.delayed(Duration(milliseconds: 2000));

    final productJsonString = await rootBundle.loadString(
      'assets/samples/product_list.json',
    );

    return ProductModel.fromJsonStringList(productJsonString);
  }
}
