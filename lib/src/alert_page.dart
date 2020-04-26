import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alert page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlert(context),
          child: Text("mostrar alerta "),
          color: Colors.blue,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        //cerrar al presionar afuera
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              actions: <Widget>[
                //return previos screen
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("cancelar", textAlign: TextAlign.center),
                ),

                OutlineButton(
                  onPressed: () {},
                  child: Text("aceptar"),
                  highlightedBorderColor: Colors.grey,
                ),
              ],
              title: Text("alerta"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("contenido de la alerta "),
                ],
              ));
        });
  }
}
