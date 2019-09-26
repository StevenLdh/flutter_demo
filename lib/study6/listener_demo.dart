import 'package:flutter/material.dart';

class ListenerDemoPage extends StatefulWidget {
  @override
  _ListenerDemoPageState createState() => _ListenerDemoPageState();
}

class _ListenerDemoPageState extends State<ListenerDemoPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('原始指针事件Demo'),
      ),
      body: Center(
          child: Listener(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            onPointerDown: (PointerDownEvent event) => print('PointerDownEvent'),
            onPointerUp: (PointerUpEvent event) => print('PointerUpEvent'),
            onPointerMove: (PointerMoveEvent event) => print('PointerMoveEvent'),
            onPointerCancel: (PointerCancelEvent event) => print('PointerCancelEvent'),
          ),
      ),
    );
  }

}
