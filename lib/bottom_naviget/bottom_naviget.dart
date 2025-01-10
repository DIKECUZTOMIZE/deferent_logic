import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BottomNavigetApp());
}

class BottomNavigetApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:BottomHomePage() ,
    );
  }
}

class BottomHomePage extends StatefulWidget{

  @override
  State<BottomHomePage> createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
 int isSelectedIndex =0;

 List<Widget> mList=[


   Center(child:SecondpageBottom() ,),
   Center(child: Text('Add'),),

   Center(child: Text('Graph'),),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Naviget'),
      ),

      body: mList[isSelectedIndex] ,


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Color(0xfff291cf),

        onTap: (value){
          isSelectedIndex = value ?? 0;

          setState(() {});

        },

          currentIndex:isSelectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.email_outlined,), label: ''),

            BottomNavigationBarItem(icon: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                    color: Color(0xfff291cf),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Icon(Icons.add,color: Colors.white,)),label: ''),

            BottomNavigationBarItem(icon: Icon(Icons.auto_graph,),label: ''),

          ],)

    );
  }
}
class SecondpageBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       body:Column(
         children: [

           Center(
             child: Container(

               child:Text('jhk',style: TextStyle(fontSize: 79),) ,
             ),
           )
         ],
       ) ,
     );
  }
}


/// StateFull and StatefullBuider
/// null Check operator,
/// show plugin