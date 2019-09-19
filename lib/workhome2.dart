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
          color: Colors.grey[300],
          child: Stack(
            children: <Widget>[

              ListView(),
              ///分为两层
              ///下层
              Container(
                width: double.maxFinite,
                //height: 360,
                decoration: BoxDecoration(

                ),
                alignment: Alignment.topLeft,      ///对齐方式, 左上角对齐
                child: Padding(
                  padding: EdgeInsets.only( top: _kSystemAppBarHeight+10),    ///偏移距离
                  child: Container(
                    width: double.maxFinite,
                    //height: 160,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(0, 1),
                              blurRadius: 3)
                        ]),
                    child:BodyMain()
                  ),
                ),
              ),

              ///上层
              Positioned(
                left: 24,
                right: 24,
                top: 90,
                child: TitleBar(),     ///自定义Headbar
              ),
            ],
          ),
        ));
  }
}

///浮动栏
class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[

          Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius:BorderRadius.all( Radius.circular(30)),
                boxShadow: [BoxShadow( color: Color(0x662E5AFF),offset: Offset(0, 4), blurRadius: 15 )]
            ),
            child:Center(
              child: Text(
                "水果区",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///下层栏
class BodyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Stack(
        children: <Widget>[
          ///水平状态栏
          HeaderBar(),
          ///菜单选择
          MyListView(),
          ///图片
          Images(),
          ///产品
          MyListTitle(),
        ],
      ),
    );
  }
}

///菜单选择
class MyListView extends StatelessWidget {
  static const List billDatas = const [
    {'name': '水果', 'icon': Icons.repeat_one},
    {'name': '蔬菜', 'icon': Icons.select_all},
    {'name': '饮料', 'icon': Icons.format_list_bulleted},
    {'name': '肉类', 'icon': Icons.alarm},
    {'name': '米面', 'icon': Icons.transfer_within_a_station},
    {'name': '调料', 'icon': Icons.pie_chart},
    {'name': '烟酒', 'icon': Icons.explicit},
    {'name': '更多', 'icon': Icons.more_vert},
  ];
  List<Widget> getItems() {
    return billDatas.map((item) {
      return Padding(
        padding: const EdgeInsets.only(
            left: 30
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ///上面图标显示
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.all(Radius.circular(29))),
              child: Center(
                  child: Icon(
                    item['icon'],
                    color: Colors.tealAccent,
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

  Widget getView(){
    return Center(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: getItems()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75,left: 5, right: 5),
      child: Center(
        child: Container(
            width: double.maxFinite,
            //height: 360,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0, 1),
                      blurRadius: 3)
                ]),
            child:   ListView.custom(
              childrenDelegate: SliverChildBuilderDelegate(
                      (context,index){

                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 40),
                      child: getView(),
                    );
                  },
                  childCount:  1

              ),
              scrollDirection: Axis.horizontal,
            ),
        ),
      ),
    );
  }
}

///图片
class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:190,left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Image.network(
            'http://pic237.nipic.com/file/20190827/27588209_172246323087_2.jpg?t=${DateTime.now().millisecondsSinceEpoch}',
            frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
              print("----------  frame=$frame  wasSynchronouslyLoaded = $wasSynchronouslyLoaded");
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 10),
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
    );
  }
}

///菜单选择
class MyListTitle extends StatelessWidget {
  static const List billDatas = const [
    {'name': '苹果','enname':'甘肃红富士', 'icon': 'http://pic237.nipic.com/file/20190827/27588209_172246323087_2.jpg'},
    {'name': '芒果','enname':'台北芒果', 'icon': 'http://pic128.huitu.com/res/20190901/450439_20190901213822341050_1.jpg'},
    {'name': '香蕉','enname':'热带香蕉', 'icon': 'http://pic128.huitu.com/res/20190903/926746_20190903152041751050_1.jpg'},
    {'name': '梨子','enname':'汉源金花梨', 'icon': 'http://pic128.huitu.com/res/20190826/1558596_20190826235938906060_1.jpg'},
    {'name': '葡萄','enname':'本地葡萄', 'icon': 'http://pic124.huitu.com/res/20190701/1792553_20190701000527691060_1.jpg'},
    {'name': '西瓜','enname':'冰糖瓜', 'icon': 'http://pic128.huitu.com/res/20190820/1153901_20190820163747181010_1.jpg'},
    {'name': '猕猴桃','enname':'蒲江红心猕猴桃', 'icon': 'http://pic237.nipic.com/file/20190827/27588209_172246323087_2.jpg'},
    {'name': '更多','enname':'更多水果', 'icon': 'http://pic128.huitu.com/res/20190828/192531_20190828163937009020_1.jpg'},
  ];
  List<Widget> getItems() {
    return billDatas.map((item) {
      return Padding(
        padding: const EdgeInsets.only(
            left: 0
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item['icon']),
              ),
              title: Text(item['name']),
              subtitle: Text(item['enname']),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('horse');
              },
              selected: true,
            ),
          ],
        ),

      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 380,left: 5, right: 5),
      child: Center(
        child: Container(
          width: double.maxFinite,
          //height: 360,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(0, 1),
                    blurRadius: 3)
              ]),
          child:   ListView.custom(
            childrenDelegate: SliverChildBuilderDelegate(
                    (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 0),
                    child: getItems()[index],
                  );
                },
                childCount:  getItems().length

            ),
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}

///水平状态栏
class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
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
              height: 40,
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
      'http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190207/c936c6a4d4104dd0ae77aea7ff9c3085.jpeg';

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

