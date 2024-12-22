

import 'package:flutter/material.dart';

InputDecoration getTexFiled(){

  return InputDecoration(

    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),

    suffixIcon: Icon(Icons.access_alarms_outlined),
    prefixIcon: Icon(Icons.accessible_forward_sharp),

  );
}




/// IconsData:

InputDecoration getTexFiled1({ msuffixIcons, required String mLabel, required String mhint, Icon? mIcons}) {
  return InputDecoration(

    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),

    suffixIcon: msuffixIcons,
    labelText:mLabel ,
    hintText:mhint ,
    prefixIcon:mIcons ,





 //   prefixIcon:

  );
}