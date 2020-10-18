import 'package:product_test/domain/entity/product.dart';
import 'package:product_test/domain/repository/product_repository.dart';

class GetAllProductUC {
  final ProductRepository _productRepository;
  GetAllProductUC(
    this._productRepository,
  );
  Future<List<Product>> call() async =>
      await _productRepository.getAllProduct();
}
