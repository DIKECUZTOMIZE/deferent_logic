import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderThemeAndStyle extends ChangeNotifier{


  bool isSelectedThemes = false;

  getLightTheme()=> isSelectedThemes;

  getDrakThems(bool value)async{

    var prefs = await SharedPreferences.getInstance();
       prefs.setBool('themsId',value)   ;

    isSelectedThemes = value;
    notifyListeners();
  }
}