// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cupertinostore/model/app_state_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('loadProducts', () {
    final model = AppStateModel();
    model.loadProducts();
    expect(model.getProducts().length, 38);
    expect(model.getProducts()[0].name, 'Vagabond sack');
    expect(model.getProducts()[0].price, 120);
  });
  test('addProductToCart', () {
    final model = AppStateModel();
    model.loadProducts();
    // Initial cart is empty
    expect(model.productsInCart.length, 0);
    // Add product 1 to cart
    model.addProductToCart(1);
    expect(model.productsInCart.keys.toList(), [1]);
    expect(model.productsInCart[1], 1);
    // Add product 2 to cart
    model.addProductToCart(2);
    expect(model.productsInCart.keys.toList(), [1, 2]);
    expect(model.productsInCart[1], 1);
    // Add product 1 to cart
    model.addProductToCart(1);
    expect(model.productsInCart.keys.toList(), [1, 2]);
    // number of product 1 increases.
    expect(model.productsInCart[1], 2);
  });
}
