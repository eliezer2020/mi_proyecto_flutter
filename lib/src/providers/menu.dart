
import 'dart:convert';

import "package:flutter/services.dart" show rootBundle;


class _MenuProvider {

List <dynamic> menuOpciones =[];

_MenuProvider(){
cargarData();
}

  Future<List<dynamic>> cargarData () async  {

    
    final  respuesta = await rootBundle.loadString("data/menu_opts.json");

    

      Map datamap =  json.decode(respuesta);
      print("datamap***");
      print(datamap["rutas"]);
       menuOpciones=  datamap["rutas"];
      
      print("menuopciones***");
      print(menuOpciones);
      
    return menuOpciones;
  }


}

final  menu1 = new _MenuProvider();
