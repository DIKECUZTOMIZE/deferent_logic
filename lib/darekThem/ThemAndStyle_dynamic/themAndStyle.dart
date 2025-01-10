import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/appBar_popupMenu/appBar.dart';
import 'package:untitled/darekThem/ThemAndStyle_dynamic/ProviderThemAndStyle.dart';
import 'package:untitled/darekThem/ThemAndStyle_dynamic/uiThemAndStyleHelper.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ProviderThemeAndStyle(),child: ThemeAndStylApp()));
}


class ThemeAndStylApp extends StatefulWidget {
  @override
  State<ThemeAndStylApp> createState() => _ThemeAndStylAppState();
}

class _ThemeAndStylAppState extends State<ThemeAndStylApp> {

  @override
  void initState() {
    super.initState();

     getThems();
     setState(() {});
  }

   getThems()async{

      var prefs = await SharedPreferences.getInstance();
     bool thems =  prefs.getBool('themsId')  ?? false  ;

     if(thems ){
         context.read<ProviderThemeAndStyle>().getDrakThems(true);
     }
     else{
        context.read<ProviderThemeAndStyle>().getLightTheme();
     }
      }
  @override
  Widget build(BuildContext context) {




    return  MaterialApp(
      themeMode: context.watch<ProviderThemeAndStyle>().getLightTheme() ?  ThemeMode.dark : ThemeMode.light,

      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: ThemeAndAppHomePage(),
    );
  }
}
class ThemeAndAppHomePage extends StatelessWidget {

 bool isLight =  false;
  @override
  Widget build(BuildContext context) {

   isLight = Theme.of(context).brightness == Brightness.light;

    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SwitchListTile(
              value: context.watch<ProviderThemeAndStyle>().getLightTheme(),
              onChanged:(value){
                context.read<ProviderThemeAndStyle>().getDrakThems(value);
              }),

          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
              color: isLight ? Colors.black : Colors.white
              ),
              child: Center(child: Text('Good And Bad',style: getTextStyle25(mFontColor: isLight ? Colors.white : Colors.black ),)),
            ),
          ),

          mSpecing(),

          Center(child: Text('Ram And Sita',style: getTextStyle15(),)),

          Text('Sanjit And Sumi',style: getTextStyle25(mFontColor:Colors.black).copyWith(fontSize:19 )),

          Text('Ball And Putu',style: getTextStyle35(mFontColor:Theme.of(context).brightness == isLight ? Colors.black : Colors.black) ),

          Text('Mota And Maiki',style: getTextStyle55()),
        ],
      ) ,
    );
  }
}

