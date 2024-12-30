
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateFormat mFormrt =DateFormat.yMMMd();

  DateTime  selectedDate = DateTime.now();

  List<String> mMonth = ['Jan','Feb', 'Mar','Apr','May','Jun','July','Agst','Sep','Oct','Nov','Dec'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // StatefulBuilder(builder:(context, setState) {
          // return
          //   Container(
          //       height: 60,
          //       decoration: BoxDecoration(
          //           border: Border.all(color:Colors.black)
          //       ),
          //       width: double.infinity,
          //       child:  Center(
          //         child: InkWell(onTap: ()async{
          //           showDatePicker(context: context,
          //             firstDate: DateTime.now(),
          //             lastDate: DateTime(9999),
          //           );
          //
          //        // print(selectedDate =DateTime.fromMillisecondsSinceEpoch(int.parse(mFormrt.toString())));
          //
          //         setState;
          //         }, child: Text(mFormrt.format(selectedDate!).toString()),
          //         ),
          //
          //
          //       )
          //
          //   );
          // },),


          Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color:Colors.black)
              ),
              width: double.infinity,
              child:  Center(
                child: InkWell(onTap: ()async{

                  if( Platform.isIOS || Platform.isMacOS){

                    selectedDate=  await showCupertinoModalPopup(context: context, builder: (context) {
                      return CupertinoDatePicker(
                        maximumDate:DateTime.now().subtract(Duration(days: 365)) ,
                        minimumDate:DateTime.now().add(Duration(hours: 1)) ,
                        minimumYear:DateTime.now().year-1 ,
                        maximumYear:DateTime.now().day ,
                        onDateTimeChanged: (value) {
                          setState(() {});
                        },);
                    },);
                  }else {

                    selectedDate = await  showDatePicker(context: context,
                        firstDate: DateTime(DateTime.now().year-1),
                        lastDate: DateTime(9999)) ?? DateTime.now();

                    //fillterData =  ;

                    setState(() {});
                  }

                }, child: Text(mFormrt.format(selectedDate).toString()),
                ),
              )
          ),

          Center(
            child: Text('${mFormrt.format(selectedDate).split('/')}, '),
          )
        ],
      ),
    );

  }





}
