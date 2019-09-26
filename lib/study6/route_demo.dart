import 'package:flutter/material.dart';
import 'package:flutter_app2/study6/page_a_demo.dart';
import 'package:flutter_app2/study6/page_b_demo.dart';

class RouteDemoPage extends StatefulWidget {
  @override
  _RouteDemoPagePageState createState() => _RouteDemoPagePageState();
}

class _RouteDemoPagePageState extends State<RouteDemoPage> {
  String resultStr = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('路由与导航 Demo'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
//          child: constructListView(),
//          child: builderListView(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlineButton(
                  onPressed: () async {

                    resultStr = await Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return PageA( from: 'Hello Page A' );
                      }),
                    );

                  },
                  child: Text('动态路由'),
                  textColor: Colors.blue,
                ),
                SizedBox(
                  height: 30,
                ),
                OutlineButton(
                  onPressed: () async {
                    var result = await Navigator.pushNamed(
                        context,
                        '/pageB',
                        arguments: '你好，Page B'
                    );
                    resultStr = result;
                  },
                  child: Text('静态路由'),
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
//          child: costomListView(),
        ));


  }


  test() async {

    ///命名路由参数传递
    await Navigator.pushNamed(
        context,
        '/pageB',
        arguments: '你好，Page B'
    );


    ///动态路由参数传递
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) {
        return PageB( data: 'Hello Page B' );
      }),
    );


    Navigator.pushNamed(
        context,
        '/Screen2',
    );

    Navigator.pop(
        context
    );

    Navigator.pushReplacementNamed(
        context,
        '/Screen4',
        arguments: ''
    );

    Navigator.popAndPushNamed(
        context,
        '/Screen4',
        arguments: ''
    );

    ///退出登录
    Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
         (Route<dynamic> route) => false
    );

    ///登录成功
    Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (Route<dynamic> route) => false
    );

    ///
    Navigator.pushNamedAndRemoveUntil(
        context,
        '/screen4',
        ModalRoute.withName('/screen1')
    );

  }


}
