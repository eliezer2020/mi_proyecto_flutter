import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{

@override
Widget build (context){
return Scaffold(
appBar: AppBar(title: Text("avatar page"),
actions: <Widget>[
  Container(
    margin: EdgeInsets.only(right: 5.0),
    child: CircleAvatar(
      child: Text("N/A"),
      backgroundColor: Colors.grey,
    ),
  ),

  Padding(padding: EdgeInsets.all(5.0),
  child: CircleAvatar(
backgroundImage: NetworkImage("https://autolab.com.co/wp-content/uploads/2019/07/carro-01.jpg"),  ),)
],),

body: Center(
  child: FadeInImage(
    placeholder: AssetImage("assets/Loading_2.gif"),
     image: NetworkImage("https://i2.cdn.turner.com/money/dam/assets/130423094442-tesla-model-s-620xa.jpg"),
     fadeInDuration: Duration(milliseconds: 3500),),
),

);

}

}