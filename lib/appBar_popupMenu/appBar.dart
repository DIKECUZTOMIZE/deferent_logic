import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/appBar_popupMenu//providerFilseAppBar.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (context) => ProviderAppBar(),child: AppBarApp()));
}

class AppBarApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

       themeMode: context.watch<ProviderAppBar>().getLightMode() ? ThemeMode.dark : ThemeMode.light,
       darkTheme: ThemeData.dark(),
        theme: ThemeData(),
        home: AppBarHomePage()
    );

  }


}

class AppBarHomePage extends StatefulWidget{
  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {

  bool slected= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('AppBar'),

        actions: [
          PopupMenuButton(

            initialValue: !slected,
            enabled:  true,

            onSelected: (value){

              slected = value ?? Provider.of<ProviderAppBar>(context,listen: false).getLightMode();
              setState(() {});

            },
            itemBuilder: (context) {
            return [
              PopupMenuItem(child: SwitchListTile(
                    title: Text('Dark Mode'),

                  value: Provider.of<ProviderAppBar>(context,listen: false).getLightMode() ,

                  onChanged:(value){
               slected  = context.read<ProviderAppBar>().getDarkMode(value);
                    setState(() {});
              } ))
            ];
          },)
        ],
      ),

      body: Column(
        children: [
      SwitchListTile(
      title: Text('Dark'),

        value: context.watch<ProviderAppBar>().getLightMode() ,

        onChanged:(value){

          context.read<ProviderAppBar>().getDarkMode(value);
          setState(() {});
        } )
        ],
      ),
    );
  }
}