import 'package:product_test/data/datasource/product_source_remote.dart';
import 'package:product_test/domain/entity/product.dart';
import 'package:product_test/domain/repository/product_repository.dart';

class FakeProductRepositoryImp implements ProductRepository {
  final ProductSourceRemote _productSourceRemote;
  FakeProductRepositoryImp(
    this._productSourceRemote,
  );
  @override
  Future<List<Product>> getAllProduct() async {
    return await _productSourceRemote.fetchAll();
  }
}
