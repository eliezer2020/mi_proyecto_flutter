import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  String _nombre = "";
  int counter = 0;
  String _email = "";
  String _password = "";
  TextEditingController _inputDate = new TextEditingController();
  String _fechaText = "";
  String _controlvalue ="estudiante";

  //drodown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          Divider(),

          Row(children: <Widget>[
            Icon(Icons.content_paste, color: Colors.black45,),
            Text("categoria:"),
            SizedBox(width: 30.0,),
            _combobox(context),
          ],),
          
          Divider(),
          _mostrarPersona()
          ,
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //iniciar teclado
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      onChanged: (inputdata) {
        setState(() {
          _nombre = inputdata;
          counter = _nombre.length;
        });
      },

      decoration: InputDecoration(
        labelText: "nombre completo",
        hintText: "Escribe el nombre",
        counter: Text("n°: $counter"),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget _mostrarPersona() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            "Datos guardados",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          """Nombre: $_nombre
      Email:  $_email
      Pass:   $_password
      categoria:  $_controlvalue
      """,
          textAlign: TextAlign.center,
        ),
        Text("  fecha   $_fechaText"),
      ],
    );
  }

  Widget _crearEmail() {
    return TextField(
      //iniciar teclado
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (inputdata) {
        setState(() {
          _email = inputdata;
        });
      },

      decoration: InputDecoration(
        labelText: "email",
        hintText: "Escribe el email",
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  _crearPass() {
    return TextField(
      //iniciar teclado
      autofocus: false,
      obscureText: true,

      onChanged: (inputdata) {
        setState(() {
          _password = inputdata;
        });
      },

      decoration: InputDecoration(
        labelText: "contraseña",
        hintText: "Escribe el pass",
        icon: Icon(Icons.enhanced_encryption),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      //iniciar teclado
      autofocus: false,
      keyboardType: TextInputType.datetime,
      controller: _inputDate,
      onTap: () {
        //desabilitar enfoque al texfield
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectFecha(context);
      },

      decoration: InputDecoration(
        labelText: "bithday",
        hintText: "Escribe fecha de nacimiento ",
        icon: Icon(Icons.date_range),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  _selectFecha(BuildContext context) async {
    DateTime fecha = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(
        1995,
      ),
      lastDate: new DateTime.now(),
      //idoma del picker
      locale: Locale("es", "ES"),
    );

    if (fecha != null) {
      setState(() {
        _fechaText = fecha.toString();
        _inputDate.text = _fechaText;
      });
    }
  }

  Widget _combobox(BuildContext context) {
    
    List<DropdownMenuItem<String>> myitems = new List();
    List<String> opcionesdropdown = ["estudiante", "maestro", "administrativo"];

    opcionesdropdown.forEach((item) {
      myitems.add(DropdownMenuItem(
        child: Text(item.toString()),
        value: item,
      ));
    });

    return DropdownButton(items: myitems,
    value: _controlvalue,
     onChanged: (item) {
      
      setState(() {
        _controlvalue= item;

      });
    });
  }
}
