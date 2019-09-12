import 'package:flutter/material.dart';

class FlexDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹性布局'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //

            SizedBox(
              height: 16,
            ),

          Text(
              "水平显示Demo",
              textAlign: TextAlign.center,
            ),

            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),

            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 30.0,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),
            Text(
              "竖直显示Demo",
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 30.0,
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 30.0,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
