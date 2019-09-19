import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHome>
    with SingleTickerProviderStateMixin {

  TabController tabController;
  List<String> tabDatas;

  @override
  void initState() {
    super.initState();

    tabDatas = [
      '通知',
      '公告',
    ];

    ///
    tabController = new TabController(
      length: tabDatas.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          centerTitle: true
        ),
        body:BodyMain()
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
          ///图片
          Images(),
          ///产品
          MyListTitle(),
        ],
      ),
    );
  }
}
///图片
class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
///产品
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
      padding: const EdgeInsets.only(top: 190,left: 5, right: 5),
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
