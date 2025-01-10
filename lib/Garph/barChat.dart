import 'package:d_chart/d_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(DChartApp());
}

class DChartApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:DChartHomePage() ,
    );
  }
}

class DChartHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    List<OrdinalData> mDataOrdial = [];

    List<OrdinalData> mDataGraoh =[];


  num  highestamount = 0;
    for(OrdinalData eachDataGraph in mDataOrdial){

      if(highestamount < 200){
        highestamount = 200;

      }

      mDataGraoh.add(OrdinalData(domain: '2/6/2024', measure: 233));

    }

   return  Scaffold(
      appBar: AppBar(title: Text('Home Page'),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
              aspectRatio:16/9,
              child: DChartBarT(

                groupList: [
                TimeGroup(id: '1', data: [TimeData(domain: DateTime.now().subtract(Duration(days: 2)), measure: 2222)])
              ],),
          ),
       ],
      ),
    );
  }
}

