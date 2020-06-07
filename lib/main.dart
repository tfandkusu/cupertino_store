import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'model/app_state_model.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) {
        // アプリ状態を作成する
        AppStateModel stateModel = AppStateModel();
        stateModel.loadProducts();
        return stateModel;
        // ラムダ式について
        // 1行の時は=>
        // オブジェクトに対してメソッドを呼び出すとき
        // ..で呼び出すとCascade呼び出しになる。
      },
      // アプリそのものを作る
      child: CupertinoStoreApp(),
    )
  );
}
