import 'package:flutter/cupertino.dart' show BuildContext, Key, State, StatefulWidget, Widget;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/foundation.dart';

class ReportDashboard extends StatefulWidget {
  const ReportDashboard({Key? key}) : super(key: key);

  @override
  State<ReportDashboard> createState() => _ReportDashboardState();
}

class _ReportDashboardState extends State<ReportDashboard> {
  late List<CoursesData> _chartData;

  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        title:ChartTitle(text: 'Courses',textStyle:TextStyle(fontSize: 24) ) ,
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          BarSeries<CoursesData, String>(
              name: 'My Rate',
              dataSource: _chartData,
              xValueMapper: (CoursesData course, _) => course.code,
              yValueMapper: (CoursesData course, _) => course.rate,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis:CategoryAxis(),
        primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            title: AxisTitle(text: 'Rate of Attendance',textStyle:TextStyle(fontSize: 24)),
            // numberFormat: NumberFormat.simpleCurrency()
        ),
      ),
    );
  }

  List<CoursesData> getChartData(){
    final List<CoursesData> chartData = [
      CoursesData('Comp 401', 80,),
      CoursesData('Comp 302', 70),
      CoursesData('Comp 201', 90),
      CoursesData('Comp 305', 77),
      CoursesData('Comp 304', 50),
      CoursesData('Comp 405', 56),

    ];
    return chartData;
  }
}

class CoursesData {
  CoursesData(this.code, this.rate,);

  final String code;
  final double rate;
  // final color barcolor ;
}
