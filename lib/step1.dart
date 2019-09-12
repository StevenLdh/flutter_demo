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
            width: double.maxFinite,    ///宽度占满屏幕宽度
            height: 160,                ///高度160
            color: Colors.blue,         ///背景色
          ),

          ///上层
          Positioned(                 ///定位组件，确定相对Stack偏移的距离
            left: 24,                 ///距离屏幕左右各24
            right: 24,                ///顶部屏幕顶部80
            top: 80,
            child: Container(
              width: double.maxFinite,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,                                  ///设置背景色
                borderRadius: BorderRadius.all(Radius.circular(8)),   ///设置边框圆角半径
                border: Border.all( width: 0.5, color: Colors.grey)   ///设置边框样式
              ),

            ),
          ),
        ],
      ),
    ));
  }

}
