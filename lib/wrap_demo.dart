import 'package:flutter/material.dart';

class WrapFlowDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
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
              "Wrap布局Demo",
              textAlign: TextAlign.center,
            ),

            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: new Text('AH', style: TextStyle(fontSize: 10.0),)),
                  label: Text('Hamilton Hello World'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: new Text('ML', style: TextStyle(fontSize: 10.0),)),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: new Text('HM', style: TextStyle(fontSize: 10.0),)),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
                  label: Text('Laurens'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
                  label: Text('Jack'),
                ),
              ],
            ),

            SizedBox(
              height: 16,
            ),



          ],
        ),
      ),
    );
  }
}
