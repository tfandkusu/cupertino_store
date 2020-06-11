import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'model/app_state_model.dart';

/// Flutterアプリはmain関数から始まる
void main() {
  // runAppメソッドにWidgetを渡してアプリが始まる
  return runApp(
    // AppStateModelを使うWidgetはChangeNotifierProviderで囲む。
    ChangeNotifierProvider<AppStateModel>(
      create: (_) {
        // アプリ状態を作成する
        AppStateModel stateModel = AppStateModel();
        // 商品一覧を読み込み
        stateModel.loadProducts();
        return stateModel;
        // ラムダ式について
        // 1行の時は=>
        // オブジェクトに対してメソッドを呼び出すとき
        // ..で呼び出すとCascade呼び出しになる。
      },
      // AppStateModelを使うアプリそのもののWidget
      child: CupertinoStoreApp(),
    )
  );
}
