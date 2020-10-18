import 'package:product_test/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProduct();
}
