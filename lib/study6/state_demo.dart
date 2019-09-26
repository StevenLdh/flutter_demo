import 'package:flutter/material.dart';

class StateDemoPage extends StatefulWidget {
  @override
  _StateDemoPageState createState() => _StateDemoPageState();
}

class _StateDemoPageState extends State<StateDemoPage> {
  int index = 0;

  ///状态初始化
  @override
  void initState() {
    super.initState();
    print("----------- I am initState ");
  }
  ///依赖资源变化时，比如主题颜色，字体等
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("----------- I am didChangeDependencies ");
  }
  ///刷新UI
  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("-----------I am didUpdateWidget  ");
  }
  ///debug模式下 热更新模式时调用
  @override
  void reassemble() {
    super.reassemble();
    print("-----------I am reassemble  ");
  }
  ///从Widget树移除
  @override
  void deactivate() {
    super.deactivate();
    print("-----------I am deactivate  ");
  }
  @override
  void dispose() {                    ///释放
    super.dispose();
    print("-----------I am  dispose  ");
  }
  @override
  Widget build(BuildContext context) {
    print("-----------I am build  ");

    return Scaffold(
      appBar: AppBar(
        title: Text('State Demo'),
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: Text('I changed state $index'),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          ///通知系统状态改变
          setState(() {
            index++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

///无状态的Widget
class StatelessWidgetDemo extends StatelessWidget {

  ///内部属性要用final修饰，防止被意外修改
  final String data;

  StatelessWidgetDemo({Key key, this.data})
      : super( key:key );

  @override
  Widget build(BuildContext context) {
    return Text( data??'', style:  TextStyle( fontSize: 14,),);
  }
}

///有状态的Widget
class StatefulDemo extends StatefulWidget {
  final String data;
  StatefulDemo({Key key, this.data}):super(key:key);

  @override
  _StatefulDemoState createState() => _StatefulDemoState();
}

///对应的状态对象
class _StatefulDemoState extends State<StatefulDemo> {
  @override
  Widget build(BuildContext context) {
    return Text( widget.data??'', style:  TextStyle( fontSize: 14,),);
  }
}
