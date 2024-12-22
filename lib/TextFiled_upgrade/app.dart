import 'package:untitled/TextFiled_upgrade/homePage.dart';
import 'package:untitled/TextFiled_upgrade/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void  main (){
  runApp(App());
}

class App extends StatelessWidget {

  String Data = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Data != '' ? HomePage():Page1()
    );
  }
}


///  SharePreferenc
///  Textfield Advance
///