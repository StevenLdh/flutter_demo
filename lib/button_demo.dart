import 'package:flutter/material.dart';
import 'package:flutter_app2/utils/ant_font_utils.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮组件'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


            SizedBox(
              height: 16,
              width: double.maxFinite,
            ),

            RaisedButton(
              color: Colors.blue,
              child: Text('RaisedButton'),
              textColor: Colors.white,
              onPressed: (){},
            ),

            SizedBox(
              height: 16,
            ),

            FlatButton(
              //color: Colors.blue,
              child: Text('FlatButton'),
              textColor: Colors.blue,
              onPressed: (){},
            ),

            SizedBox(
              height: 16,
            ),

            IconButton(
              icon: Icon( Icons.print ),
              onPressed: (){},
              iconSize: 36,
            ),

            SizedBox(
              height: 16,
            ),

            OutlineButton(
              child: Text('OutlineButton'),
              textColor: Colors.blue,
              onPressed: (){},
            ),

            SizedBox(
              height: 16,
            ),

            FloatingActionButton(
              child: Icon( Icons.navigation ),
              onPressed: (){},
            ),


          ],
        ),
      ),
    );
  }
}
