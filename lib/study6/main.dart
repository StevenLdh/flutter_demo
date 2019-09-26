import 'package:flutter/material.dart';
import 'package:flutter_app2/study6/databinding_demo.dart';
import 'package:flutter_app2/study6/listener_demo.dart';
import 'package:flutter_app2/study6/page_b_demo.dart';
import 'package:flutter_app2/study6/provide_demo.dart';
import 'package:flutter_app2/study6/route_demo.dart';
import 'package:flutter_app2/study6/state_demo.dart';

import 'gesture_demo.dart';

///程序入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '基本组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '基本组件'),
//      routes: {   ///静态路由配置
//        '/pageB': (context) => PageB(data: "静态路由"),
//      },
      onGenerateRoute: (RouteSettings setting) {
        print(setting.arguments);

        if ('/pageB' == setting.name) {
          return MaterialPageRoute(builder: (context) {
            return PageB(data: setting.arguments);
          });
        }
        return null; //一般是自定义 错误页面
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List demoList;

  @override
  void initState() {
    super.initState();

    demoList = [
      {
        'name': '状态组件',
        'page': StateDemoPage(),
      },
      {'name': '数据绑定', 'page': DataBindingDemoPage()},
      {'name': '数据绑定Provider', 'page': PrivateDemoPage()},
      {'name': '原始指针事件', 'page': ListenerDemoPage()},
      {'name': '手势识别组件', 'page': GestureDemoPage()},
      {'name': '路由与导航', "page": RouteDemoPage()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: ListView.separated(
            itemCount: demoList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = demoList[index];
              return RaisedButton(
                child: Center(
                  child: Text(data['name']),
                ),
                onPressed: () {
                  _gotoPage(data['page']);
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
          ),
        ));
  }

  ///页面跳转
  void _gotoPage(Widget page) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
