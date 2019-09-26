import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrivateDemoPage extends StatefulWidget {
  @override
  State<PrivateDemoPage> createState() => _PrivateDemoPageState();
}

class _PrivateDemoPageState extends State<PrivateDemoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: ChangeNotifierProvider<UserInfoModel>(
              builder: (context) => UserInfoModel(),
              child: Builder(builder: (context){
                UserInfoModel userInfoModel = Provider.of<UserInfoModel>(context);
                if( userInfoModel.userInfo == null )
                  return Text(  "加载中..."  );
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text( '用户名称:${userInfoModel.userInfo.name }' ),
                    SizedBox( height: 20,),
                    OutlineButton(
                      onPressed: (){
                        userInfoModel.setUserName('Jack');
                      },
                      child: Text('修改名称'),
                    )
                  ],
                );
              })
            )
          )
      ),
    );
  }

}

class UserInfo{
  String name;
  String addr;
  String phone;
  UserInfo({this.name,this.addr,this.phone});
}

//View Model
class UserInfoModel with ChangeNotifier  {

  UserInfoModel(){
    loadData();
  }

  UserInfo _userInfo;
  UserInfo get userInfo => _userInfo;

  setUserName( String name ){
    _userInfo.name = name;
    notifyListeners();
  }

  ///模拟网络加载数据
  void loadData() async{
    await Future.delayed( Duration( seconds: 3 ) );
    _userInfo = UserInfo(
        name: '小明',
        addr: '四川成都',
        phone: '02880648888' );
    notifyListeners();
  }
}