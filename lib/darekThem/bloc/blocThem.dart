import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/darekThem/bloc/bloc_filse.dart';
import 'package:untitled/darekThem/bloc/event.dart';

void main(){
  runApp(BlocProvider(create: (context) => BlocThemsFilse(),child: BlocAppThems()));
}
class BlocAppThems extends StatefulWidget{
  @override
  State<BlocAppThems> createState() => _BlocAppThemsState();
}

class _BlocAppThemsState extends State<BlocAppThems> {
  @override
  Widget build(BuildContext context) {
    context.watch<BlocThemsFilse>().state;
     return MaterialApp(

       themeMode: context.watch<BlocThemsFilse>().state.isSelectedLight ? ThemeMode.light : ThemeMode.dark,
       darkTheme: ThemeData.dark(),
       theme: ThemeData(),
       home: HomePage()
     );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
        title: Text('Home Page'),
      ),
    );
  }
}