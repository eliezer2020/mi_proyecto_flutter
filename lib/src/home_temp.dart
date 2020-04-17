import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {

final List <String> rawList  = ["gerson","merari","isaaac","mama","papa","abuelo","abuela","primos"];

  @override
  Widget build (context) {
    return Scaffold(
      appBar: AppBar(title: Text("appbar de hometemp"),),
      body: ListView(
        children: 
        //<Widge>[listtitle, title text "", divider .....],
        _crearList(),
      

    ),
    );

    
  }
List <Widget> _crearList(){
List <Widget> myList = new List<Widget>();
int i =0;
  for (String texto in rawList) {
    i++;
  Widget temp = ListTile(title: Text(texto,textScaleFactor: 1.75,), subtitle: Text(i.toString(),textScaleFactor: 1.0,),
  trailing: Icon(Icons.arrow_right),
  onTap: (){},) ;

myList.add(temp);
if (i!=rawList.length )myList.add(Divider( thickness: 2.0,color: Colors.blueGrey,));


  }

  return myList;
}

}
/*
List <Widget> _crearlist (List<String> rawList){
  List <Widget> myList = new List<Widget>();

  rawList.forEach( (x) {
    // crear widget temporal
    final Widget temp = ListTile(title: Text(x)) ;

myList.add(temp);
myList.add(Divider());

  }); //foreach



  return myList;
}

*/