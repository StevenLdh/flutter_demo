import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  final String from;
  PageA({Key key, this.from}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('这是PageA'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: <Widget>[


              SizedBox( height: 40,),

              Text( '接收到的参数：${ from??''}', ),

              SizedBox( height: 20,),
              Text('我是PageA页面,我的字体是蓝色的。', style: TextStyle( fontSize: 24, color: Colors.blue),),

              SizedBox( height: 20,),

              RaisedButton(
                onPressed: (){
                  Navigator.pop(context,'从动态路由Demo PageA返回' );
                },
                child: Text( '退出页面' ),
                color: Colors.blue,
              )

            ],
          ),
        ));
  }

}
