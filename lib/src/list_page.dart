import 'dart:async';
import 'dart:math';

import "package:flutter/material.dart";

class ListPage extends StatefulWidget {
  ListPageState createState() => new ListPageState();
}

class ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _mylist = new List();
  Random _random = new Random();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchdata();
        //_agregar10();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("list builder"),
        ),
        body: Stack(
          children: <Widget>[
            _crearList(context),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearList(BuildContext context) {

    
    return RefreshIndicator(

        onRefresh: _refrescar,
        semanticsLabel: "actualizando ",
       
        
                child: ListView.builder(
                controller: _scrollController,
                itemCount: _mylist.length,
                itemBuilder: (BuildContext context, int index) {
                  final imagen = _mylist[index];
        
                  return FadeInImage(
                    placeholder: AssetImage("assets/Loading2.gif"),
                    image: NetworkImage("https://picsum.photos/id/$imagen/500/300"),
                  );
                },
              ),
            );
          }
        
          void _agregar10() async {
            int lastItem = await _generarRandom();
        
            for (int i = 0; i < 10; i++) {
              _mylist.add(lastItem);
              lastItem++;
              setState(() {});
            }
          }
        
          Future<int> _generarRandom() async => _random.nextInt(50);
        
          Future<Null> _fetchdata() async {
            final duration = new Duration(seconds: 2);
            isLoading = true;
            setState(() {});
            return new Timer(duration, requestHttp);
          }
        
          void requestHttp() {
            isLoading = false;
            _agregar10();
            _scrollController.animateTo( _scrollController.position.pixels +150, 
            duration: new Duration(seconds: 1), curve: Curves.linear);
          }
        
          // eliminar escucha del scroll cada vez aque se destryuye la pagina
          //para no apilar memoria
          @override
          dispose() {
            super.dispose();
            _scrollController.dispose();
          }
        
          _crearLoading() {
            if (isLoading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 20.0,),
                ],
              );
            } else {
              return Container();
            }
          }
        
          Future <void >_refrescar() async {

            
            Duration duration2 = new Duration(seconds: 1);

             return  Timer(duration2,
             (){
               _mylist.clear();
            setState(() {});
      
            _agregar10();
            });
            
           

          }
}
