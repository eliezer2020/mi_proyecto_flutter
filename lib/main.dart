import 'package:flutter/material.dart';
import 'package:mi_proyecto/src/alert_page.dart';
import 'package:mi_proyecto/src/animated_container_class.dart';

import 'package:mi_proyecto/src/avatar_page.dart';
import 'package:mi_proyecto/src/card_page.dart';
import 'package:mi_proyecto/src/home_page.dart';
import 'package:mi_proyecto/src/input_page.dart';
//import 'package:mi_proyecto/src/home_temp.dart';

//support languajes
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mi_proyecto/src/list_page.dart';
import 'package:mi_proyecto/src/slider_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: "home",

      routes: <String, WidgetBuilder>{
        "home": (context) => HomePage(),
        "alert": (context) => AlertPage(),
        "avatar": (context) => AvatarPage(),
        "card": (context) => CardPage(),
        "container": (context )=> AnimatedContainerClass(),
        "inputs": (context) => InputPage(),
        "slider": (context) => SliderPage(),
        "listpage": (context) => ListPage(), 

      },


      //languaje support
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // spanish
 ],
   
    );
  }
}

