import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/darekThem/providerFilse.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemesProvider(), child: ThemApp()));
}

class ThemApp extends StatefulWidget {
  @override
  State<ThemApp> createState() => _ThemAppState();
}

class _ThemAppState extends State<ThemApp> {
  @override
  void initState() {
    super.initState();
    getThems();
    setState(() {});
  }

  getThems() async {
    var prefs = await SharedPreferences.getInstance();
    bool uid = prefs.getBool('Thems') ?? false;

    if (uid) {
      context.read<ThemesProvider>().getDarkThems(true);
    } else {
      context.read<ThemesProvider>().getlightThem();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.watch<ThemesProvider>().getlightThem()
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
          textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 50),
        bodyMedium: TextStyle(fontSize: 25),
        bodySmall: TextStyle(fontSize: 15),
      )),
      theme: ThemeData(
          textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 50),
        bodyMedium: TextStyle(fontSize: 25),
        bodySmall: TextStyle(fontSize: 15),
      )),
      home: ThemHomePage(),
    );
  }
}

class ThemHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' light Them and dark Them',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          Text(
            ' light Them and dark Them',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          Text(' light Them and dark Them',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 20)),

           /// Value mane hl initial aru  aite changhua nai direct bina paramter use kurile hl
          ///onChange mane hl initial tu chang kora rin time khai karone peramater use kuribo lage

          SwitchListTile(
              title: Text(context.watch<ThemesProvider>().getlightThem() ? 'Light' : 'Drak'),
              value: context.watch<ThemesProvider>().getlightThem(),
              onChanged: (ram) {
                context.read<ThemesProvider>().getDarkThems(ram);
              })
        ],
      ),
    );
  }
}
