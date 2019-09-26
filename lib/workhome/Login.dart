import 'package:flutter/material.dart';
import 'package:flutter_app2/workhome/ScaffoldIndex.dart';

class Login extends StatelessWidget {

  final String from;
  String resultStr = '';
  Login({Key key, this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '接收到的参数：${ from??''}',
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
                        return ScaffoldIndex( from: 'Hello Login!' );
                      }),
                    );

                  },
                  child: Text('登录'),
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