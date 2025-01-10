import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(AppOrentation());
}

class  AppOrentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home:HomeOrentation() ,
    );
  }
}

class HomeOrentation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   double mWidth =  MediaQuery.of(context).size.width ;
   double mHeight = MediaQuery.of(context).size.height;

    print('height:  $mHeight');
    print(mWidth);

    return Scaffold(
      body: Center(
        child: Container(
              height: mHeight*.4,
              width: mWidth*.4,
              color: Colors.red,
          child: LayoutBuilder(builder: (_, constraints) {

              return constraints.maxWidth > constraints.maxHeight ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:200,
                    width:constraints.maxWidth*0.9,
                    color: Colors.green,
                  ),

                  // Container(
                  //   height:200,
                  //   width:constraints.maxWidth*0.4,
                  //   color: Colors.blue,
                  // ),
                ],
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height:100,
                    width:constraints.maxWidth*0.50,
                    color: Colors.green,
                  ),
                  // Container(
                  //   height:100,
                  //   width:constraints.maxWidth*0.50,
                  //   color: Colors.blue,
                  // ),
                ],
              );
          },),
        )
      )
    );
  }
}
