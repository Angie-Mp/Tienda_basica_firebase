import 'package:crud_firebase/ui/1_lista_form.dart';
import 'package:crud_firebase/ui/1.2_formulario.dart';
import 'package:crud_firebase/ui/3_listaCS.dart';
import 'package:crud_firebase/ui/2.1_lista_CR.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

class Categoria extends StatefulWidget {
  @override
  _CategoriaState createState() => _CategoriaState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _CategoriaState extends State<Categoria> {
  List<Product> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Categorias'),
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Listadeformulario()));
              })),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: Image.asset(
              'assets/logo1.png',
              height: 120,
              width: 120,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 40),
            child: RaisedButton(
              color: Colors.amberAccent[100],
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: Colors.amber)),
              child: Text('Comida rapida'),
              onPressed: () => _listadeproductos(context, null),
            ),
          ),
          //
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Image.asset(
              'assets/logo2.png',
              height: 120,
              width: 120,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 40),
            child: RaisedButton(
              color: Colors.amberAccent[100],
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: Colors.amber)),
              child: Text('Comida sana'),
              onPressed: () => _listaCS(context, null),
            ),
          )
        ],
      ),
      //
    );
  }
}

void _listadeproductos(BuildContext context, Product product) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Listadeproductos(product)),
  );
}

void _listaCS(BuildContext context, ComidaS comidaS) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ListaCS(comidaS)),
  );
}
