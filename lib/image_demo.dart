import 'package:flutter/material.dart';
import 'package:flutter_app2/utils/ant_font_utils.dart';

class ImageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片组件_Image'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height: 16,
              ),

              //
              Text("图片加载完成处理：FadeIn"),
              SizedBox(
                height: 12,
              ),

              Image.network(
                'http://pic68.nipic.com/file/20150601/8164280_104301508000_2.jpg?t=${DateTime.now().millisecondsSinceEpoch}',
                frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
                      print("----------  frame=$frame  wasSynchronouslyLoaded = $wasSynchronouslyLoaded");
                      if (wasSynchronouslyLoaded) {
                         return child;
                      }
                      return AnimatedOpacity(
                         child: child,
                         opacity: frame == null ? 0 : 1,
                         duration: const Duration(seconds: 10),
                         curve: Curves.easeOut,
                      );
                  },
              ),


              SizedBox(
                height: 16,
              ),

              Text(
                "图片加载完成载中显示处理",
              ),
              SizedBox(
                height: 12,
              ),

              Image.network(
                'http://pic51.nipic.com/file/20141025/8649940_220505558734_2.jpg?t=${DateTime.now().millisecondsSinceEpoch}',
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null)
                    return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),


              SizedBox(
                height: 16,
              ),

//              Text(
//                "图片与颜色组合",
//              ),
//              SizedBox(
//                height: 12,
//              ),
//
//              Image.network(
//                'http://pic15.nipic.com/20110725/7485157_212820844000_2.png?t=${DateTime.now().millisecondsSinceEpoch}',
//                color: Colors.redAccent,
//                colorBlendMode: BlendMode.srcOut,
//              ),


              SizedBox(
                height: 24,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

