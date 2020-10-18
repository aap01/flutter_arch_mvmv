import 'package:get_it/get_it.dart';
import 'package:product_test/data/datasource/product_source_remote.dart';
import 'package:product_test/data/repository/product_repository_impl.dart';
import 'package:product_test/domain/repository/product_repository.dart';
import 'package:product_test/domain/usecase/get_all_product_uc.dart';
import 'package:product_test/presentation/product/product_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final locator = GetIt.instance;

class DependencyInjection {
  DependencyInjection._();

  static void _initObjects() {
    //domain layer
    locator.registerLazySingleton(
      () => GetAllProductUC(
        locator(),
      ),
    );

    //repo
    locator.registerLazySingleton<ProductRepository>(
      () => FakeProductRepositoryImp(
        locator(),
      ),
    );

    //data layer
    locator.registerLazySingleton<ProductSourceRemote>(
      () => FakeProductSourceRemoteImpl(),
    );
  }

  static List<SingleChildWidget> injectProviders() {
    _initObjects();
    return [
      ChangeNotifierProvider(
        create: (_) => ProductNotifier(
          locator(),
        )..getProduct(),
      ),
    ];
  }
}
