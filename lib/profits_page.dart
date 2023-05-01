// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// List <Map> data= [
//   {"type":1,"businessPrice": 200, "personalPrice": 400},
//   {"type":2,"businessPrice": 100, "personalPrice": 800},
// ];
//
// class ProfitsPage extends StatefulWidget {
//   ProfitsPage({Key key}) : super(key: key);
//
//
//   @override
//   _ProfitsPageState createState() => _ProfitsPageState();
// }
//
// class _ProfitsPageState extends State<ProfitsPage> {
//   List<ChartSampleData> _chartData=[];
//
//   @override
//   void initState() {
//     _chartData = getChartData();
//     super.initState();
//   }
//
//     @override
//   Widget build(BuildContext context) {
//       double localProfit, internationalProfit;
//     if (data[0]["type"]==1) localProfit= data[0]["personalPrice"]-data[0]["businessPrice"];
//     if (data[1]["type"]==1) localProfit= data[1]["personalPrice"]-data[1]["businessPrice"];
//     if (data[0]["type"]==2) internationalProfit= data[0]["personalPrice"]-data[0]["businessPrice"];
//     if (data[1]["type"]==2) internationalProfit= data[1]["personalPrice"]-data[1]["businessPrice"];
//     double profit = localProfit+  internationalProfit;
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Align(
//               child: Text("الأرباح"),
//               alignment: Alignment.centerRight),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                width: MediaQuery.of(context).size.width,
//                 child: Text("صافي الأرباح للفترة من 01-04-2023 إلى 03-04-2023 ",
//                   textAlign: TextAlign.right,
//                  ),
//               ),
//               SizedBox(height: 20.0,),
//               Container(
//                 width : MediaQuery.of(context).size.width,
//                 child: Text("$profit د.ل ",
//                 textAlign: TextAlign.center,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   fontSize: 32.0,
//                   color: Colors.green
//                 ),),
//               ),
//               SizedBox(height: 20.0,),
//               SfCartesianChart(
//                 series: <ColumnSeries>[
//                   ColumnSeries<ChartSampleData, String>(
//                     // Binding the chartData to the dataSource of the column series.
//                     dataSource: _chartData,
//                     xValueMapper: (ChartSampleData sales, _) => sales.type,
//                     yValueMapper: (ChartSampleData sales, _) => sales.profits,
//                   ),
//                 ],
//                 primaryXAxis: CategoryAxis(),
//               ),
//
//             ],
//           ),
//         ));
//   }
//
// }
//
// List<ChartSampleData> getChartData() {
//   final List<ChartSampleData> chartData=[];
//   String type;
//   for(int i=0;i<data.length;i++){
//     if(data[i]["type"]==1) type="محلي";
//     if(data[i]["type"]==2) type="دولي";
//     chartData.add(ChartSampleData(type,data[i]["personalPrice"]-data[i]["businessPrice"]));
//   }
//
//   return chartData;
// }
// class ChartSampleData {
//   ChartSampleData(this.type,this.profits,);
//   final double profits;
//   final String type;
// }
