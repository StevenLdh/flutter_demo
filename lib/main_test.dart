import 'package:flutter/material.dart';
import 'package:flutter_app2/button_demo.dart';
import 'package:flutter_app2/container_demo.dart';
import 'package:flutter_app2/flex_demo.dart';
import 'package:flutter_app2/flow_demo.dart';
import 'package:flutter_app2/grid_demo.dart';
import 'package:flutter_app2/image_demo.dart';
import 'package:flutter_app2/listtile_demo.dart';
import 'package:flutter_app2/listview_demo.dart';
import 'package:flutter_app2/stack_demo.dart';
import 'package:flutter_app2/text_demo.dart';
import 'package:flutter_app2/wrap_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MyDemo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Hello world!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//

  List demoList;

  @override
  void initState() {
    super.initState();
    demoList = [
      ///
      { 'name': '文本组件', 'page': TextDemoPage() },
      { 'name':'图片组件',  'page':ImageDemoPage(), },
      { 'name':'按钮组件', 'page': ButtonDemoPage() },
      { 'name':'弹性布局', 'page': FlexDemoPage() },
      {'name':'流式布局-Wrap', 'page': WrapFlowDemoPage() },
      {'name':'流式布局-Flow', 'page': FlowDemoPage() },
      {'name':'层叠布局','page': StackDemoPage() },
      {'name':'容器Demo','page':ContainerDemoPage() },
      {'name':'ListViewDemo',"page":ListViewDemoPage()},
      {"name":'GridView Demo',"page":GridDemoPage()},
      {'name':'ListTile Demo', "page":ListTileDemoPage()},
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
          padding: const EdgeInsets.only(top:20, left: 20, right: 20),
          child: ListView.separated(
            itemCount: demoList.length,
            itemBuilder: (context,index){
              Map<String, dynamic> data = demoList[index];
              return RaisedButton(
                child: Center(
                  child: Text( data['name'] ),
                ),
                onPressed: (){
                  _gotoPage( data['page']);
                },
              );
            },
            separatorBuilder: (context,index){
              return SizedBox( height: 5,);
            },
          ),
        )
    );
  }
  ///页面跳转
  void _gotoPage(Widget page){
    print("--------------xxxx    $page");
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return page;
    }));
  }
}
