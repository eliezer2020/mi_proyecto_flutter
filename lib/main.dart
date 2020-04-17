import 'package:flutter/material.dart';
import 'package:mi_proyecto/src/alert_page.dart';
import 'package:mi_proyecto/src/avatar_page.dart';
import 'package:mi_proyecto/src/card_page.dart';
import 'package:mi_proyecto/src/home_page.dart';
//import 'package:mi_proyecto/src/home_temp.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build (context ) {
    
    return MaterialApp (
      debugShowCheckedModeBanner: false,
     // home: HomePage(),
     initialRoute: "home",

     routes: <String, WidgetBuilder>{
        "home": (context ) => HomePage(),
        "alert":(context) => AlertPage(),
        "avatar": (context)=> AvatarPage(),
         "card": (context) => CardPage(),





     },

  
    );



  }
}