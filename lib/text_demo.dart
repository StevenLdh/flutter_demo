import 'package:flutter/material.dart';

class TextDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件_Text'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //
              Text("这是默认测试数据"),

              SizedBox(
                height: 16,
              ),

              Text(
                "这是缩放测试数据",
                textScaleFactor: 0.6,
              ),
              Text(
                "这是缩放测试数据",
                textScaleFactor: 3.0,
              ),

              SizedBox(
                height: 16,
              ),

//            Text(
//              "这是默认测试数据",
//              textAlign: TextAlign.right,
//            ),
//
//            SizedBox(
//              height: 16,
//            ),

              Text(
                "这是字体测试",
                style: TextStyle(
                  fontFamily: 'kuaile',
                  fontSize: 40,
                  color: Colors.redAccent,
                  //backgroundColor: Colors.indigo,
                ),
              ),
              SizedBox(
                height: 16,
              ),

              Text(
                "这是下划线测试",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  //backgroundColor: Colors.indigo,
                ),
              ),
              SizedBox(
                height: 16,
              ),

              //Flutter Widget采用现代响应式框架构建，这是从 React 中获得的灵感，中心思想是用widget构建你的UI。 Widget描述了他们的视图在给定其当前配置和状态时应该看起来像什么。当widget的状态发生变化时，widget会重新构建UI，Flutter会对比前后变化的不同， 以确定底层渲染树从一个状态转换到下一个状态所需的最小更改（译者语：类似于React/Vue中虚拟DOM的diff算法）。
              Text.rich(
                  TextSpan(
                      text: '这是Rich文件Demo:',
                      children: [
                        TextSpan( text: 'Flutter Widget采用现代响应式框架构建，这是从', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                        TextSpan( text: 'React ', style: TextStyle(
                          color: Colors.blue,
                        )),
                        TextSpan( text: ' 中获得的灵感，中心思想是用widget构建你的UI。', style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        )),


                      ])),


            ],
          ),
        ),
      ),
    );
  }
}
