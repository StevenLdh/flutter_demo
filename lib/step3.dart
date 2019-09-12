import 'package:flutter/material.dart';

///程序入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///App配置
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '操作实战',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

///页面
@immutable
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          ///分为两层
          ///下层
          Container(
            width: double.maxFinite,
            height: 160,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.deepPurple])),
            alignment: Alignment(-1, -0.38),
          ),

          ///上层
          Positioned(
            left: 24,
            right: 24,
            top: 86,
            child: Container(
              width: double.maxFinite,
//              height: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(0, 1),
                        blurRadius: 3)
                  ]),
              child: GridView.count(              ///选择使用GridView
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                crossAxisCount: 4,                ///每行显示4个Item
                childAspectRatio: 1,              ///Item 宽高比
                children: getItems(),
                shrinkWrap: true,                 ///GridView的高度由内容确定,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  //
  static const List _billDatas = const [
    {'name': '销售单', 'icon': Icons.repeat_one},
    {'name': '零售单', 'icon': Icons.select_all},
    {'name': '采购单', 'icon': Icons.format_list_bulleted},
    {'name': '收款单', 'icon': Icons.alarm},
    {'name': '盘点', 'icon': Icons.transfer_within_a_station},
    {'name': '报表', 'icon': Icons.pie_chart},
    {'name': '查应收', 'icon': Icons.explicit},
    {'name': '更多', 'icon': Icons.more_vert},
  ];

  List<Widget> getItems() {
    return _billDatas.map((item) {
      return Center(        ///Item 内容居中显示,
        child: buildModelItem(item),
      );
    }).toList();
  }

  Widget buildModelItem(Map item){
    return Column(
      mainAxisSize: MainAxisSize.min,         ///在竖直方向尽可能占据少的是空间
      children: <Widget>[
        ///上面图标显示
        Container(
          width: 36,            ///设置容器宽度
          height: 36,           ///设置容器高度
          ///color 与 decoration 同时只能使用一个
          ///color: Colors.grey[300],      ///仅仅是矩形框，
          decoration: BoxDecoration(      ///装饰器 功能更强大
              color: Colors.grey[300],    ///背景色
              borderRadius: BorderRadius.all(Radius.circular(18))   ///边框半径
          ),
          child: Center(
              child: Icon(
                item['icon'],
                color: Colors.blue,
              )),
        ),

        ///下面名称
        Text(
          item['name'],
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  ///构建水平 Header栏
  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),

        //用户头像
        _buildHeaderImageRedPoint(),

        SizedBox(
          width: 12,
        ),

        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2))),
            alignment: Alignment.center,
            child: _buildSearch(),
          ),
        ),

        SizedBox(
          width: 30,
        ),
      ],
    );
  }

  ///构建头像+小红点
  static const String headUrl =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568190482108&di=d3e7d0be904ac8b49e27f66c5471939b&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2F50%2Fv2-f34145b01ab1d5bb463cac35ddc9777d_hd.jpg';

  Widget _buildHeaderImageRedPoint() {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        ///下层是头像
        CircleAvatar(
          maxRadius: 24,
          backgroundColor: Colors.grey,
//          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          backgroundImage: NetworkImage(headUrl),
        ),

        ///小红点, 我们自己构建小红点
        _buildRedPoint(),

        ///
      ],
    );
  }

  ///小红点
  Widget _buildRedPoint() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.red),
      child: Center(
        child: Text(
          '3',
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }

  ///构建搜索栏布局
  Widget _buildSearch() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 24),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.close, color: Colors.grey),
          hintText: '请输入客户或者商品名称',
          hintStyle: TextStyle(fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
