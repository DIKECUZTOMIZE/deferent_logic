import 'package:flutter/cupertino.dart';

class ProviderAppBar extends ChangeNotifier{

  bool isSelected = false;

  getLightMode ()=>isSelected;


  getDarkMode(bool value){
    isSelected = value;
     notifyListeners();
  }

}