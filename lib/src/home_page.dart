import "package:flutter/material.dart";
import 'package:mi_proyecto/src/providers/menu.dart';
import 'package:mi_proyecto/src/util/icons_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menu1.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print("data");
        print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    List<Widget> myList = [];

    data.forEach((items) {
      Widget temp = ListTile(
        title: Text(items["texto"]),
        leading: getIcon(items["icon"]),
        trailing: Icon(
          Icons.arrow_back,
          color: Colors.blueGrey,
        ),
        onTap: () {
          //navegacion
          Navigator.pushNamed(context, items["ruta"]);
        },
      );

      myList.add(temp);
      //quitar divider de la ultima linea 
      myList.add(Divider(
        thickness: 2.0,
      ));
    });

    return myList;
  }
} //fin claseHomepage
