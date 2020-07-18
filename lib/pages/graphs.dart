import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisi/classes/line_chart_hisi.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graphs extends StatefulWidget {
  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<LinearSales, int>> _createSampleData() {
      final data = [
        new LinearSales(0, 6),
        new LinearSales(1, 25),
        new LinearSales(2, 100),
        new LinearSales(3, 75),
      ];

      return [
        new charts.Series<LinearSales, int>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: data,
        )
      ];
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Package ', style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('100010', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ))
                    ],
                  ),
                  Divider(thickness: 3,),
                  Text('Type: Medicine')
                ],
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))
            ),),
            Container(
              width: 150,
              height: 150,
              child: SimpleLineChart(_createSampleData(), animate: true,),
            )
          ],
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}