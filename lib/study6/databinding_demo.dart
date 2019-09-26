import 'package:flutter/material.dart';

class DataBindingDemoPage extends StatefulWidget {
  @override
  _DataBindingDemoPageState createState() => _DataBindingDemoPageState();
}

class _DataBindingDemoPageState extends State<DataBindingDemoPage> {

  UserInfo userInfo;        ///模拟获取用户信息
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataBinding Demo'),
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: Text( userInfo==null?'加载中...': 'name=${userInfo.name},addr = ${userInfo.addr}'),
          )),
    );
  }
  ///模拟网络加载数据
  void loadData() async{
    await Future.delayed( Duration( seconds: 3 ) );
    userInfo = UserInfo( name: '小明', addr: '四川成都', phone: '02880648888' );
    ///通知刷新UI
    setState(() {
    });
  }
}

class UserInfo{
  String name;
  String addr;
  String phone;
  UserInfo({this.name,this.addr,this.phone});
}