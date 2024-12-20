
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/trenary_page_open/homePage.dart';
import 'package:untitled/trenary_page_open/page2.dart';

void main(){
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  String? uid = '';
  @override
  void initState() {
    super.initState();
  }

 void getPrefsValue()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: uid != '' ? HomePage() : Page2()
    );
  }
}
