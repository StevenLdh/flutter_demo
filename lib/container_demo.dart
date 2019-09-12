import 'package:flutter/material.dart';

class ContainerDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('容器Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //

              SizedBox(
                height: 16,
              ),

            Container(
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius:BorderRadius.all( Radius.circular(8))
              ),
              child:Center(
                child: Text(
                  "背景色",
                  textAlign: TextAlign.center,
                ),
              ),
            ),

              SizedBox(
                height: 16,
              ),

              Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:BorderRadius.all( Radius.circular(30))
                ),

                child:Center(
                  child: Text(
                    "圆角+背景色",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.only( left: 12, right: 12),
                child: Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [ Color(0xFF2E5AFF),Color(0xFF1A8AFA)]),
                      boxShadow: [BoxShadow( color: Color(0x662E5AFF),offset: Offset(0, 4), blurRadius: 15 )]
                  ),

                  child:Center(
                    child: Text(
                      "阴影",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius:BorderRadius.all( Radius.circular(8)),

                ),

                child:Center(
                  child: Text(
                    "渐变色背景",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                    style: BorderStyle.solid
                  ),
                  borderRadius:BorderRadius.all( Radius.circular(8)),

                ),

                child:Center(
                  child: Text(
                    "边框",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
//                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
