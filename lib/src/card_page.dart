import "package:flutter/material.dart";

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cards"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          contenedorTarjeta(),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          contenedorTarjeta(),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          contenedorTarjeta(),
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      //border radios izquierdos RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0)))
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //color: Colors.amberAccent,

      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("christina"),
            subtitle: Text("aqui va la descripcion de la tarjeta "),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text("cancelar")),
              OutlineButton(onPressed: () {}, child: Text("continuar"))
            ],
          ),
        ],
      ),
    );
  }

  final cardtipo2 = Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    borderOnForeground: true,
    //quitar la ilusion wrap del container
    elevation: 0.0,

    //enmarcar contenido a la carta
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage("assets/Loading_2.gif"),
          image: NetworkImage(
              "https://www.fundacion-affinity.org/sites/default/files/el-gato-necesita-tener-acceso-al-exterior.jpg"),
          fit: BoxFit.scaleDown,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text("imagen de gatito"),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
            width: 0.5,
          )),
        ),
      ],
    ),
  );

  contenedorTarjeta() {
    return Container(
      child: cardtipo2,
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ],
        //color del borde
        border: Border.all(width: 2.5, color: Colors.greenAccent),
        //color de la caja
        color: null,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
