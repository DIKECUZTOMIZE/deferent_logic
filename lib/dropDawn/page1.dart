import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String isSelectedDrop = 'Debit';
  List<String> dataDropList = ['Debit', 'Credit', 'Brows', 'Loan',];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Page'),),

      body: Column(
        children: [

          // StatefulBuilder(builder:(_,ss){
          //   return DropdownMenu(
          //   initialSelection: isSelectedDrop,
          //     onSelected: (value){
          //     /// If null
          //       isSelectedDrop =  value ?? 'Debit';
          //       setState(() {});
          //     },
          //     width: double.infinity,
          //       inputDecorationTheme: InputDecorationTheme(
          //         enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
          //         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
          //       ) ,
          //
          //   /// Map Fucntion use kuri:
          //     dropdownMenuEntries: dataDropList.map((dropType){
          //       return DropdownMenuEntry(value: dropType, label: dropType);
          //     }).toList() ,
          //
          //     /// Nije List bonai eta eta koi:
          //       // dropdownMenuEntries: [
          //       //   DropdownMenuEntry(value:'Debit', label: 'Debit'),
          //       //   DropdownMenuEntry(value:'Credit', label: 'Credit'),
          //       //   DropdownMenuEntry(value:'Loan', label: 'Loan'),
          //       //   DropdownMenuEntry(value:'Brows', label: 'Brows'),
          //       // ]
          //
          //   );},),

          StatefulBuilder(builder:(context, setState) {
            return Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                border: Border.all(color: Colors.black)
              ),
              child: DropdownButton(


                  borderRadius: BorderRadius.circular(21),
                  /// Initial Value:
                  value: isSelectedDrop,

                  ///  Iate nije List bonai o kuribo o pare aru direct map function bonai kuribo para
                  items:dataDropList.map((dropButttom){
                    return  DropdownMenuItem(child: Text(dropButttom),value: dropButttom,) ;
                  }).toList() ,

                  onChanged: (value){
                    isSelectedDrop = value ?? 'Debit';
                    setState(() {});
                  }),
            );}
          )

        ],
      ),
    );
  }
}
