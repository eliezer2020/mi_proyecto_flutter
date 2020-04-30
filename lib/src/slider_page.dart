import "package:flutter/material.dart";

class SliderPage extends StatefulWidget {
  SLidePageState createState() => SLidePageState();
}

class SLidePageState extends State<SliderPage> {
  double _slidervalue = 200;
  bool checkvalue = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("slider"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: _crearSlider(),
          ),
          _crearCheckbox(),
          _crearCheckbox2(),
          Container(
            child: _crearImage(),
            padding: EdgeInsets.all(1.0),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _slidervalue.roundToDouble(),
      label: "${_slidervalue.toInt()}",
      divisions: 100,
      activeColor: Colors.blueGrey,
      onChanged: (checkvalue)
          ? null
          : (valor) {
              setState(() {
                _slidervalue = valor.roundToDouble();
                print("$_slidervalue");
              });
            },
      min: 0.0,
      max: 400.0,
    );
  }

  Widget _crearImage() {
    return FadeInImage(
      image: NetworkImage("https://pluspng.com/img-png/batman-png-batman-png-1404.png"),
      width: _slidervalue,
      fit: BoxFit.fill,
      placeholder: AssetImage("assets/Loading_2.gif"),
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        title: Text("bloquear tamaño "),
        value: checkvalue,
        onChanged: (value) {
          setState(() {
            checkvalue = value;
          });
        });
  }

  Widget _crearCheckbox2(){

    return SwitchListTile(
        title: Text("bloquear tamaño "),
        value: checkvalue,
        onChanged: (value) {
          setState(() {
            checkvalue = value;
          });
        });
  }
}
