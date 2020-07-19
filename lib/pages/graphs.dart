import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisi/classes/line_chart_hisi.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Graphs extends StatefulWidget {
  final YoutubePlayerController controller;

  const Graphs({Key key, this.controller}) : super(key: key);

  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {


    List<charts.Series<LinearSales, int>> _createSampleData() {
      final data = [
        new LinearSales(0, 23),
        new LinearSales(1, 24),
        new LinearSales(2, 23),
        new LinearSales(3, 22),
        new LinearSales(4, 23),
        new LinearSales(5, 22),
        new LinearSales(6, 23),
        new LinearSales(7, 22),
        new LinearSales(8, 23),
        new LinearSales(9, 22),
        new LinearSales(10, 23),
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

    List<charts.Series<LinearSales, int>> _createSampleData1() {
      final data = [
        new LinearSales(0, 44),
        new LinearSales(1, 43),
        new LinearSales(2, 43),
        new LinearSales(3, 43),
        new LinearSales(4, 43),
        new LinearSales(5, 44),
        new LinearSales(6, 43),
        new LinearSales(7, 44),
        new LinearSales(8, 43),
        new LinearSales(9, 43),
        new LinearSales(10, 43),
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
    List<charts.Series<LinearSales, int>> _createSampleData2() {
      final data = [
        new LinearSales(0, 2),
        new LinearSales(1, 3),
        new LinearSales(2, 5),
        new LinearSales(3, 4),
        new LinearSales(4, 2),
        new LinearSales(5, 3),
        new LinearSales(6, 4),
        new LinearSales(7, 2),
        new LinearSales(8, 2),
        new LinearSales(9, 2),
        new LinearSales(10, 3),
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

    List<charts.Series<LinearSales, int>> _createSampleData3() {
      final data = [
        new LinearSales(0, 565),
        new LinearSales(1, 565),
        new LinearSales(2, 565),
        new LinearSales(3, 565),
        new LinearSales(4, 565),
        new LinearSales(5, 566),
        new LinearSales(6, 565),
        new LinearSales(7, 565),
        new LinearSales(8, 565),
        new LinearSales(9, 565),
        new LinearSales(10, 565),
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
                  Text('Type: Medicine'),
                  SizedBox(height: 5,),
                  YoutubePlayer(
                    width: MediaQuery.of(context).size.width,
                    controller: widget.controller,
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(height: 5,),
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
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 100,
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
              ),
              child: Column(
                children: <Widget>[
                      Text('Temperature Readings in Past 10 minutes (C)', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),),
                  Divider(thickness: 3,),
                  SizedBox(height: 5,),
                  Container(
                    height: 100,
                    child:  SimpleLineChart(_createSampleData(), animate: true,),

                  )
                ],
              )
            ),
            SizedBox(height: 15,),
            Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width - 100,
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
                ),
                child: Column(
                  children: <Widget>[
                    Text('Humidity Readings in Past 10 minutes (%)', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                    Divider(thickness: 3,),
                    SizedBox(height: 5,),
                    Container(
                      height: 100,
                      child:  SimpleLineChart(_createSampleData1(), animate: true,),

                    )
                  ],
                )
            ),
            SizedBox(height: 15,),
            Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width - 100,
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
                ),
                child: Column(
                  children: <Widget>[
                    Text('Pressure Readings in Past 10 minutes (%)', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                    Divider(thickness: 3,),
                    SizedBox(height: 5,),
                    Container(
                      height: 100,
                      child:  SimpleLineChart(_createSampleData1(), animate: true,),

                    )
                  ],
                )
            ),
            SizedBox(height: 15,),
            Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width - 100,
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
                ),
                child: Column(
                  children: <Widget>[
                    Text('Movement Readings in Past 10 minutes', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                    Divider(thickness: 3,),
                    SizedBox(height: 5,),
                    Container(
                      height: 100,
                      child:  SimpleLineChart(_createSampleData2(), animate: true,),

                    )
                  ],
                )
            ),
            SizedBox(height: 15,),
            Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width - 100,
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
                ),
                child: Column(
                  children: <Widget>[
                    Text('CO2 Readings in Past 10 minutes', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                    Divider(thickness: 3,),
                    SizedBox(height: 5,),
                    Container(
                      height: 100,
                      child:  SimpleLineChart(_createSampleData3(), animate: true,),

                    )
                  ],
                )
            ),
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