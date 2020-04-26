

import 'package:flutter/material.dart';

final mapIcon  = <String, IconData> {

"add_alert": Icons.add_alert,
"accessibility" : Icons.accessibility,
"folder_open": Icons.folder_open,
"input" : Icons.input,


};

Icon getIcon (String name){
  // retorna un widget icono 
  return Icon (mapIcon[name], color: Colors.blue,);
}