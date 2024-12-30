import 'package:untitled/TextFiled_upgrade/uiHelper.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {

  @override
  State<Page1> createState() => _Page1State();
}

///*  Kiu automatic hota hai :
///
class _Page1State extends State<Page1> {
  String dropdawon = 'Debit';


  bool isvisible = true;
  bool isvisible1 = true;
  bool isArows = false;

  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body:SingleChildScrollView(
        child: Column(children: [

          /// Onchange Value khuje:
          Checkbox( value: checkbox ,

              onChanged:(value){
          checkbox = value ?? true;
            setState(() {});

          } ),

          /// On seleted Value Khuje:
          DropdownMenu(
            width: double.infinity,
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder( borderRadius:  BorderRadius.circular(21)),
                focusedBorder: OutlineInputBorder( borderRadius:  BorderRadius.circular(21))
            ),
              initialSelection:dropdawon,
             onSelected: (value){
              dropdawon = value ?? 'Debit';

             },

            dropdownMenuEntries: [
               DropdownMenuEntry(value:'Credit' , label:'Cdt' ),
               DropdownMenuEntry(value: 'Brows', label: 'Br'),
               DropdownMenuEntry(value:'Loan' , label: 'Loa'),
            ],


          ),


          SizedBox(
            height: 11,
          ),

          TextField(
                    obscureText: !isvisible,
              obscuringCharacter: '*',
              onTap: (){
                isvisible = !isvisible;
                setState(() {});
              },

              decoration: InputDecoration(

                suffixIcon:isvisible ? Icon(Icons.visibility) :Icon(Icons.visibility_off)
              ),
            ),

          SizedBox(
            height: 11,
          ),


          /// On Tap Value nibisare true and false
          TextField(
            obscuringCharacter: "*",
            /// Initial Value:
             obscureText: isvisible1,

            decoration: InputDecoration(
              suffixIcon:InkWell(
                onTap: (){

                  isvisible1 = ! isvisible1;
                  setState(() {});
                },
                child:  isvisible1 ?  Icon(Icons.visibility) : Icon(Icons.visibility_off)
                ,
                          ),
              )

          ),

          SizedBox(height: 11,),

          TextField(
            decoration: InputDecoration(
              prefixText: '\$',
              suffixIcon: Icon(Icons.ac_unit_outlined)
            ),
          ),

          SizedBox(height: 11,),

          TextField(
             decoration: getTexFiled1(
                 mLabel: 'k', mhint: 'l',
             mIcons: Icon(Icons.accessible_forward_sharp)),
          ),
          
          SizedBox(height: 11,),
        

        ],),
      )
    );
  }
}
