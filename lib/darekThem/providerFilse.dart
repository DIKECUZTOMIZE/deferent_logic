import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesProvider extends ChangeNotifier{

  bool islightThems = false;

  bool getlightThem()=>islightThems;

   getDarkThems(bool value )async{
    islightThems =value ;
    notifyListeners();

    var prefs = await SharedPreferences.getInstance();
        prefs.setBool('Thems', value);
  }
}