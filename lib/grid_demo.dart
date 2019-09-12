import 'package:flutter/material.dart';

class GridDemoPage extends StatefulWidget {
  @override
  _GridDemoPagePageState createState() => _GridDemoPagePageState();
}

class _GridDemoPagePageState extends State<GridDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView Demo'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
//          child: countGridView(),
//          child: builderGridView(),
          child: builderGridView2(),
//          child: customGridView(),
        ));
  }

  ///第一种方法
  Widget countGridView() {
    return GridView.count(
      ///水平子Widget之间间距
      crossAxisSpacing: 10.0,

      ///垂直子Widget之间间距
      mainAxisSpacing: 30.0,

      ///GridView内边距
      padding: EdgeInsets.all(10.0),

      ///一行的Widget数量
      crossAxisCount: 2,

      ///子Widget宽高比例
      childAspectRatio: 2.0,

      ///TODO 子控件的宽高不在起作用，根据屏幕自动计算
      ///子Widget列表
      children: getWidgetList(),
    );
  }

  ///第二种
  Widget builderGridView() {
    List<String> datas = getDataList();
    return GridView.builder(
        itemCount: datas.length,

        ///gridDelegate  用来指定GridView的构建方式，具体实现有两个。
        ///SliverGridDelegateWithFixedCrossAxisCount： 构建一个横轴固定数量子Widget
        ///SliverGridDelegateWithMaxCrossAxisExtent：  构建一个横轴子Widget的水平最大宽度，显示数量由屏幕和相关属性决定
        // 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 20.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),

        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(datas[index]);
        });
  }

  Widget builderGridView2() {
    List<String> datas = getDataList();
    return GridView.builder(
        itemCount: datas.length,

        ///gridDelegate  用来指定GridView的构建方式，具体实现有两个。
        ///SliverGridDelegateWithFixedCrossAxisCount： 构建一个横轴固定数量子Widget
        ///SliverGridDelegateWithMaxCrossAxisExtent：  构建一个横轴子Widget的水平最大宽度，显示数量由屏幕和相关属性决定
        // 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //横轴元素尺寸
            maxCrossAxisExtent: 80,
            //纵轴间距
            mainAxisSpacing: 20.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),

        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(datas[index]);
        });
  }

  ///第三种
  Widget customGridView() {
    List<String> datas = getDataList();
    return GridView.custom(

        ///布局方式委托
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
        ),

        ///子Widget生成委托处理
        childrenDelegate: SliverChildBuilderDelegate((context, position) {
          return getItemContainer(datas[position]);
        }, childCount: datas.length)
    );
  }

  ////--------------------------------------

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }
}
