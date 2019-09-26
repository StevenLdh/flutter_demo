import 'package:flutter/material.dart';
import 'package:flutter_app2/workhome/Login.dart';

///程序入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '欢迎',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '欢迎'),
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
  String resultStr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('欢迎'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                   '欢迎来到魔幻空间！',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(
                  height: 30,
                ),
                OutlineButton(
                  onPressed: () async {

                    resultStr = await Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return Login( from: 'Hello 游客 !' );
                      }),
                    );
                  },
                  child: Text('马上体验'),
                  textColor: Colors.blue,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  resultStr ?? '没有返回值',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
          ),
        ));
  }
}