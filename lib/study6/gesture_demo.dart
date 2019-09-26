import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GestureDemoPage extends StatefulWidget {
  @override
  _GestureDemoPageState createState() => _GestureDemoPageState();
}

class _GestureDemoPageState extends State<GestureDemoPage> {
  double _top = 0;
  double _left = 0;
  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Demo'),
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: <Widget>[
              ///点击
              GestureDetector(
                onTap: () {
                  print('click 文本');
                },
                child: Text('可点击文本'),
              ),

              ///长按
              GestureDetector(
                onLongPress: () {
                  print("长按击了图片");
                },
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  width: 80,
                  height: 80,
                ),
              ),

              ///双击
              GestureDetector(
                onDoubleTap: () {
                  print("双击图标");
                },
                child: Icon(
                  Icons.ac_unit,
                  size: 36,
                ),
              ),

              ///拖动
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: _top,
                      left: _left,
                      child: GestureDetector(
                        onPanUpdate: (event){
                          setState(() {
                            _left += event.delta.dx;
                            _top  += event.delta.dy;
                          });
                        },
                        child: Image.asset(
                          'assets/images/avatar.jpg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ///缩放
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onScaleUpdate: (event){
                      setState(() {
                        _size = 100 * event.scale;
                      });
                    },
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: _size,
                      height: _size,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  //基本用法
  Widget baseUse() {
    GestureDetector(
      onTap: () {
        print('click 文本');
      },
      child: Text('可点击文本'),
    );

    GestureDetector(
      onTap: () {
        print("点击了图片");
      },
      child: Image.asset('assets/imagesavatr.jpg'),
    );
  }
}

class UserInfo {
  String name;
  String addr;
  String phone;

  UserInfo({this.name, this.addr, this.phone});
}

//View Model
class UserInfoModel with ChangeNotifier {
  UserInfoModel() {
    loadData();
  }

  UserInfo _userInfo;

  UserInfo get userInfo => _userInfo;

  setUserName(String name) {
    _userInfo.name = name;
    notifyListeners();
  }

  ///模拟网络加载数据
  void loadData() async {
    await Future.delayed(Duration(seconds: 3));
    _userInfo = UserInfo(name: '小明', addr: '四川成都', phone: '02880648888');
    notifyListeners();
  }
}
