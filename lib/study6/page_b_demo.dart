import 'package:flutter/material.dart';

class PageB extends StatelessWidget {

  final String data;
  PageB( {Key key, this.data } ) : super( key:key );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('这是PageB'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child:  Column(
            children: <Widget>[


              SizedBox( height: 40,),

              Text( '接收到的参数：${ data??''}', ),

              SizedBox( height: 20,),
              Text('我是PageB 页面,我的字体是红色的。', style: TextStyle( fontSize: 24, color: Colors.red),),

              SizedBox( height: 20,),

              RaisedButton(
                onPressed: (){

                  ///返回数据
                  Navigator.pop(context,'从 静态路由Demo PageB返回' );
                },
                child: Text( '退出页面' ),
                color: Colors.blue,
              )

            ],
          ),
        ));
  }

}
