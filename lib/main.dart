import 'package:flutter/material.dart';
import 'package:product_test/core/di.dart';
import 'package:product_test/presentation/product/product_change_notifier.dart';
import 'package:product_test/presentation/product/product_widget.dart';
import 'package:product_test/presentation/shared/notifier_state.dart';
import 'package:product_test/presentation/shared/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.injectProviders(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: Strings.PRODUCTS),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  _getProduct(context) =>
      Provider.of<ProductNotifier>(context, listen: false).getProduct();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Consumer<ProductNotifier>(
          builder: (_, productNotifier, child) {
            if (productNotifier.notifierState == NotifierState.initial) {
              return Center(
                child: Text(Strings.PRESS_TO_FETCH),
              );
            } else if (productNotifier.notifierState == NotifierState.loading) {
              return child;
            } else
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ProductWidget(productNotifier.productList[index]);
                },
                itemCount: productNotifier.productList.length,
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 16.0,
                  );
                },
              );
          },
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getProduct(context),
        tooltip: Strings.REFRESH,
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
