import 'package:flutter/material.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  _ListViewDemoPageState createState() => _ListViewDemoPageState();
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('ListView Demo'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
//          child: constructListView(),
//          child: builderListView(),
          child: separatorListView(),
//          child: costomListView(),
        ));
  }

  ///第一种
  Widget constructListView(){

    return ListView(
      children: getWidgetList(),
    );
  }

  ///第二种
  Widget builderListView(){
    List datas = getDataList();
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              left: 12, top: 16, bottom: 16),
          child: Text(datas[index]),
        );
      },
    );
  }


  ///第三种  带分割效果
  Widget separatorListView(){
    List datas = getDataList();
    return ListView.separated(
      itemCount: datas.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              left: 12, top: 16, bottom: 16),
          child: Text(datas[index]),
        );
      },
      separatorBuilder: (context, index) {
        return new Container(height: 2.0, color: Colors.blue);
      },
    );
  }

  ///第四种
  Widget costomListView(){

    List datas = getDataList();
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
          (context,index){

            return Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 16, bottom: 16),
              child: Text(datas[index]),
            );
          },
          childCount:  datas.length

      ),

    );
  }
  ///-----------------------------------------------
  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }
}
