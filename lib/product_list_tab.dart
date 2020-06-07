import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';

class ProductListTab extends StatelessWidget {
  // StatelessWidgetはbuildを持つ
  @override
  Widget build(BuildContext context) {
    // 状態を消費する
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        // 状態に従ってViewを作る
        final products = model.getProducts();
        // CustomScrollViewとCupertinoSliverNavigationBarの組み合わせで
        // ナビゲーションバーを小さくすることができる
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
            // OSの操作を邪魔しない領域を作る
            SliverSafeArea(  // BEGINNING OF NEW CONTENT
              top: false /*trueだとノッチ分の*/,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                // 各行生成担当
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (index < products.length) {
                      return ProductRowItem(
                        index: index,
                        product: products[index],
                        lastItem: index == products.length - 1,
                      );
                    }
                    return null;
                  },
                ),
              ),
            )                // END OF NEW CONTENT
          ],
        );
      },
    );
  }
}