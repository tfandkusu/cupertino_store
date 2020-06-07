import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'styles.dart';
import 'search_bar.dart';

class SearchTab extends StatefulWidget {
  // StatefulWidgetはStateを作り
  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

// アンダーバーで始めるとファイルローカルになる
class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  /// 検索ボックス
  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        // 編集コールバック
        controller: _controller,
        // これを付けると、遷移後すぐにフォーカスが写る
        focusNode: _focusNode,
      ),
    );
  }

  // Stateの中でbuildする
  @override
  Widget build(BuildContext context) {
    // アプリ全体の状態を取得して
    final model = Provider.of<AppStateModel>(context);
    // 検索結果を得る
    final results = model.search(_terms);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        // 縦に並べる
        child: Column(
          children: [
            _buildSearchBox(),
            // 余った部分すべて使う
            Expanded(
              // ListViewで一覧を表示する
              child: ListView.builder(
                itemBuilder: (context, index) => ProductRowItem(
                  index: index,
                  product: results[index],
                  lastItem: index == results.length - 1,
                ),
                itemCount: results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}