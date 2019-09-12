import 'package:flutter/material.dart';
import 'dart:ui';

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

  ///系统状态栏的高度
  double _kSystemAppBarHeight;

  @override
  Widget build(BuildContext context) {

    ///获取系统状态栏的高度
    _kSystemAppBarHeight = MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Stack(
        children: <Widget>[

          ListView(),
         ///分为两层
          ///下层
          Container(
            width: double.maxFinite,
            height: 160,
            decoration: BoxDecoration(
                gradient:     ///渐变色背景
                    LinearGradient(colors: [Colors.blue, Colors.deepPurple])),
            alignment: Alignment.topLeft,      ///对齐方式, 左上角对齐
            child: Padding(
              padding: EdgeInsets.only( top: _kSystemAppBarHeight+10),    ///偏移距离
              child: HeaderBar(),     ///自定义Headbar
            ),
          ),

          ///上层
          Positioned(
            left: 24,
            right: 24,
            top: 86,
            child: Container(
              width: double.maxFinite,
              //height: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(0, 1),
                        blurRadius: 3)
                  ]),
              child: GridView.count(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                crossAxisCount: 4,
                childAspectRatio: 1,
                children: getItems(),
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  //
  static const List billDatas = const [
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
    return billDatas.map((item) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ///上面图标显示
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(18))),
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
        ),
      );
    }).toList();
  }


}

///水平状态栏
class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[

          ///用户头像
          HeaderWidget(),

          SizedBox(
            width: 12,        ///间距
          ),

          ///搜索框占据剩余空间
          Expanded(
            child: Container(     ///对搜索框进行装饰
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,            //背景色
                borderRadius: BorderRadius.all(Radius.circular(2)),     //边框半径
              ),
              alignment: Alignment.center,
              child: SearchWidget(),
            ),
          ),

        ],
      ),
    );
  }
}


///小红点
class RedPoint extends StatelessWidget {
  final int number;

  ///消息数量
  RedPoint({this.number});

  @override
  Widget build(BuildContext context) {
    ///小于1时，不显示
    if (number <= 0) return SizedBox();

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(

          ///背景装饰
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.red),
      child: Center(
        child: Text(
          '${number > 9 ? "..." : number}',

          ///显示消息数量，>9条时，显示"..."
          style: TextStyle(fontSize: 12, color: Colors.white),

          ///字体大小和颜色
        ),
      ),
    );
  }
}

///人物头像+小红点
class HeaderWidget extends StatelessWidget {
  static const String headUrl =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568190482108&di=d3e7d0be904ac8b49e27f66c5471939b&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2F50%2Fv2-f34145b01ab1d5bb463cac35ddc9777d_hd.jpg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      ///层叠布局，布局大小依赖子Item的大小
      alignment: Alignment.topRight,

      ///子Item靠右上角对齐
      children: <Widget>[
        ///下层是圆形头像框架
        CircleAvatar(
          maxRadius: 24,

          ///半径大小
          backgroundColor: Colors.white,

          ///背景色
          ///backgroundImage: AssetImage('assets/images/avatar.jpg'),  ///资源图片
          backgroundImage: NetworkImage(headUrl),

          ///网络图片
        ),

        ///上层，右上角小红点
        RedPoint(
          number: 8,
        ),
      ],
    );
  }
}

///搜索栏
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  ///输入框控制器，通过控制器设置和获取内容
  TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      ///限制类容器
      constraints: BoxConstraints(
        ///限制子Item显示的最大高度
        maxHeight: 24,
      ),
      ///输入框
      child: TextField(
        controller: mController,
        ///对输入进行装饰
        decoration: InputDecoration(
          ///四周Padding设为0
          contentPadding: EdgeInsets.only(),
          ///左边搜索按钮
          prefixIcon: GestureDetector(
              onTap: () { print("点击了搜索");},
              child: Icon(Icons.search, color: Colors.grey)
          ),
          ///右边清除按钮
          suffixIcon: GestureDetector(
              onTap: () { mController.text = ""; },
              child: Icon(Icons.close, color: Colors.grey)
          ),
          ///没有输入的内容时的提示文本
          hintText: '请输入客户或者商品名称',
          hintStyle: TextStyle(fontSize: 14),
          ///
          border: InputBorder.none,
        ),
      ),
    );
  }
}
