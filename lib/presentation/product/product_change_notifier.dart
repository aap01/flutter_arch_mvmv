import 'package:flutter/cupertino.dart';

import 'package:product_test/domain/entity/product.dart';
import 'package:product_test/domain/usecase/get_all_product_uc.dart';
import 'package:product_test/presentation/shared/notifier_state.dart';

class ProductNotifier extends ChangeNotifier {
  final GetAllProductUC _getAllProductUC;

  ProductNotifier(
    this._getAllProductUC,
  );

  NotifierState _notifierState = NotifierState.initial;
  NotifierState get notifierState => _notifierState;
  void _setState(NotifierState notifierState) {
    _notifierState = notifierState;
    notifyListeners();
  }

  List<Product> _productList;
  List<Product> get productList => _productList;
  Future<void> getProduct() async {
    _setState(NotifierState.loading);
    _productList = await _getAllProductUC();
    _setState(NotifierState.loaded);
  }
}
