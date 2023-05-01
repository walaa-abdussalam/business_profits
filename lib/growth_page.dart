// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// //todo
// //if selected is less than 15 days , mode 1 , normal font  if(growthData.length<=30)
// //if selected more than month up to year , make axis of months   if(growthData.length>30 &&growthData.length<=365)
// //if selected more than year, make axis of years    if (growthData.length>365)
//
// List<Map> growthData=[
//   {"quantity":5,"dateTime": "2023-04-01"},
//   {"quantity":8,"dateTime": "2023-04-02"},
//   {"quantity":2,"dateTime": "2023-04-03"},
//   {"quantity":15,"dateTime": "2023-04-04"},
//   {"quantity":15,"dateTime": "2023-04-05"},
//   {"quantity":5,"dateTime": "2023-04-06"},
//   {"quantity":8,"dateTime": "2023-04-07"},
//   {"quantity":2,"dateTime": "2023-04-08"},
//   {"quantity":15,"dateTime": "2023-04-09"},
//   {"quantity":15,"dateTime": "2023-04-10"},
//   {"quantity":5,"dateTime": "2023-04-11"},
//   {"quantity":8,"dateTime": "2023-04-12"},
//   {"quantity":2,"dateTime": "2023-04-13"},
//   {"quantity":15,"dateTime": "2023-04-14"},
//   {"quantity":15,"dateTime": "2023-04-15"},
//   {"quantity":5,"dateTime": "2023-04-16"},
//   {"quantity":8,"dateTime": "2023-04-17"},
//   {"quantity":2,"dateTime": "2023-04-18"},
//   {"quantity":15,"dateTime": "2023-04-19"},
//   {"quantity":15,"dateTime": "2023-04-20"},
//   {"quantity":5,"dateTime": "2023-04-21"},
//   {"quantity":8,"dateTime": "2023-04-22"},
//   {"quantity":2,"dateTime": "2023-04-23"},
//   {"quantity":15,"dateTime": "2023-04-24"},
//   {"quantity":15,"dateTime": "2023-04-25"},
//   {"quantity":5,"dateTime": "2023-04-26"},
//   {"quantity":8,"dateTime": "2023-04-27"},
//   {"quantity":2,"dateTime": "2023-04-28"},
//   {"quantity":15,"dateTime": "2023-04-29"},
//   {"quantity":15,"dateTime": "2023-04-30"},
//   {"quantity":9,"dateTime": "2023-05-01"},
//   {"quantity":7,"dateTime": "2023-05-02"},
//   {"quantity":8,"dateTime": "2023-05-03"},
//   {"quantity":5,"dateTime": "2023-05-04"},
//   {"quantity":5,"dateTime": "2023-05-05"},
//   {"quantity":7,"dateTime": "2023-05-06"},
//   {"quantity":20,"dateTime": "2023-05-07"},
//   {"quantity":22,"dateTime": "2023-05-08"},
//   {"quantity":1,"dateTime": "2023-05-09"},
//   {"quantity":5,"dateTime": "2023-05-10"},
//   {"quantity":15,"dateTime": "2023-05-11"},
//   {"quantity":18,"dateTime": "2023-05-12"},
//   {"quantity":12,"dateTime": "2023-05-13"},
//   {"quantity":5,"dateTime": "2023-05-14"},
//   {"quantity":5,"dateTime": "2023-05-15"},
//   {"quantity":15,"dateTime": "2023-05-16"},
//   {"quantity":18,"dateTime": "2023-05-17"},
//   {"quantity":20,"dateTime": "2023-05-18"},
//   {"quantity":1,"dateTime": "2023-05-19"},
//   {"quantity":5,"dateTime": "2023-05-20"},
//   {"quantity":15,"dateTime": "2023-05-21"},
//   {"quantity":18,"dateTime": "2023-05-22"},
//   {"quantity":20,"dateTime": "2023-05-23"},
//   {"quantity":5,"dateTime": "2023-05-24"},
//   {"quantity":1,"dateTime": "2023-05-25"},
//   {"quantity":15,"dateTime": "2023-05-26"},
//   {"quantity":18,"dateTime": "2023-05-27"},
//   {"quantity":20,"dateTime": "2023-05-28"},
//   {"quantity":5,"dateTime": "2023-05-29"},
//   {"quantity":1,"dateTime": "2023-05-30"},
// ];
//
// class GrowthPage extends StatefulWidget {
//   GrowthPage({Key key}) : super(key: key);
//
//
//   @override
//   _GrowthPageState createState() => _GrowthPageState();
// }
//
// class _GrowthPageState extends State<GrowthPage> {
//   List<SalesData> _chartData=[];
//   TooltipBehavior _tooltipBehavior=TooltipBehavior(enable: true);
//
//   @override
//   void initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//             child: Text("النمو"),
//             alignment: Alignment.centerRight),
//       ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text("المبيعات للفترة من 01-04-2023 إلى 03-04-2023 ",
//                 textAlign: TextAlign.right,),
//               SizedBox(height: 20.0,),
//
//               SfCartesianChart(
//                 enableAxisAnimation: true,
//                 tooltipBehavior: _tooltipBehavior,
//                 series: <ChartSeries<SalesData, DateTime>>[
//                   LineSeries<SalesData, DateTime>(
//                       name: 'المبيعات',
//                       dataSource: _chartData,
//                       xValueMapper: (SalesData sales, _) => sales.date,
//                       yValueMapper: (SalesData sales, _) => sales.sales,
//                     //  dataLabelSettings: DataLabelSettings(isVisible: true),
//                       enableTooltip: true
//                   )
//                 ],
//                 primaryXAxis: DateTimeAxis(
//                   interval: 1,
//                     visibleMinimum: _chartData[1].date,
//                     visibleMaximum: _chartData[30].date
//                 ),
//                 zoomPanBehavior: ZoomPanBehavior(
//                 enablePanning: true,
//               ),
//         ),
//             ],
//           ),
//         ));
//   }
//
// }
// /// get sum if month or year
// List<SalesData> getChartData() {
//   final List<SalesData> chartData=[];
//   for(int i=0;i<growthData.length;i++){
//     DateTime date = DateTime.parse(growthData[i]["dateTime"]);
//     chartData.add(SalesData(date, growthData[i]["quantity"]));
//   }
//
//   return chartData;
// }
// class SalesData {
//   SalesData(this.date, this.sales);
//   final DateTime date;
//   final double sales;
// }
