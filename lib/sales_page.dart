import 'package:flutter/material.dart';

List <Map> data=[{"card":"libyana","quantity":2,"personalPrice": 80},{"card":"madar","quantity":2,"personalPrice": 200},{"card":"ltt","quantity":5,"personalPrice": 120}];


class SalesPage extends StatefulWidget {

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage>
    with TickerProviderStateMixin
{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            child: Text("المبيعات"),
            alignment: Alignment.centerRight),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildTabBar(),
          SizedBox(
            height: 10,
          ),
          Expanded(child: _buildTabSectionsView()),
        ],
      ),
    );
  }


  Widget _buildTabBar() {
    return TabBar(
        labelColor: Colors.deepOrange,
        unselectedLabelColor: Colors.grey[500],
        indicatorColor: Colors.deepOrange,
        controller: _tabController,
        tabs: [
          Tab(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("العدد"),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("السعر"),
            ),
          ),
        ]);
  }

  Widget _buildTabSectionsView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              children: <Widget>[
                Text("المبيعات للفترة من 01-04-2023 إلى 03-04-2023 ",
                  textAlign: TextAlign.right,),
                SizedBox(height: 20.0,),
                Table(
                  border: TableBorder.all(
                      width: 2.0, color: Colors.deepOrange),
                  children: [
                    TableRow(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                                child: Text("عدد الكروت التي تم بيعها",
                                  style: TextStyle(fontSize: 14.0),)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                                child: Text("الصنف", style: TextStyle(
                                    fontSize: 14.0),)),
                          ),

                        ]
                    ),
                    for(int i=0;i<data.length;i++)
                      buildRow(i,0),
                  ],
                )
              ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              children: <Widget>[
                Text("المبيعات للفترة من 01-04-2023 إلى 03-04-2023 ",
                  textAlign: TextAlign.right,),
                SizedBox(height: 20.0,),
                Table(
                  border: TableBorder.all(
                      width: 2.0, color: Colors.deepOrange),
                  children: [
                    TableRow(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                                child: Text("سعر المبيعات",
                                  style: TextStyle(fontSize: 14.0),)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                                child: Text("الصنف", style: TextStyle(
                                    fontSize: 14.0),)),
                          ),

                        ]
                    ),
                    for(int i=0;i<data.length;i++)
                      buildRow(i,1),
                  ],
                )
              ]
          ),
        ),

      ],
    );
  }
}
TableRow buildRow(int index, int type){
  data.sort((a, b) => (b['quantity']).compareTo(a['quantity']));
  List<Map> dataSortedQ = List.from(data);
  data.sort((a, b) => (b['personalPrice']).compareTo(a['personalPrice']));
  List<Map> dataSortedP = List.from(data);

  return TableRow(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Center(
              child: type==0?
              Text(dataSortedQ[index]["quantity"].toString(), style: TextStyle(
                  fontSize: 14.0),):
              Text(dataSortedP[index]["personalPrice"].toString(), style: TextStyle(
                  fontSize: 14.0),)
          ),
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
          child: Center(
              child: type==0?
              Text(dataSortedQ[index]["card"], style: TextStyle(
                  fontSize: 14.0),):
              Text(dataSortedP[index]["card"], style: TextStyle(
                  fontSize: 14.0),)
          ),
        ),
      ]
  );
}