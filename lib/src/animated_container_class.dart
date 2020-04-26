import 'dart:math';

import "package:flutter/material.dart";

class AnimatedContainerClass extends StatefulWidget {
  @override
  AnimatedCOntainerState createState() => AnimatedCOntainerState();
}

class AnimatedCOntainerState extends State<AnimatedContainerClass> {
  double _widgt = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderradius = BorderRadius.circular(8.0);

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: myRandom,
        child: Icon(Icons.play_arrow),
      ),
      appBar: AppBar(
        title: Text("contenedor animado "),
      ),
      body: Center(

        //unica diferencia con container es duration
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500,),

          //curves modifica la animacion
          curve: Curves.easeInOutQuart,
          height: _height,
          width: _widgt,
          

          decoration: BoxDecoration(
            borderRadius: _borderradius,
            color: _color,

          )

        ),
      ),
    );
  }
  void myRandom() {

    Random ruleta = Random();
      
          setState(() {
            _widgt= ruleta.nextInt(300).toDouble();
            _height = ruleta.nextInt(300).toDouble();

            _color = Color.fromARGB(ruleta.nextInt(255), ruleta.nextInt(255) , ruleta.nextInt(255), 1);
            _borderradius= BorderRadius.circular(ruleta.nextInt(300).toDouble());

           } );
         
  }
}

