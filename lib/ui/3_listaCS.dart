import 'package:crud_firebase/main.dart';
import 'package:crud_firebase/ui/1_lista_form.dart';
import 'package:crud_firebase/ui/1.2_formulario.dart';
import 'package:crud_firebase/ui/2.4_cancelar.dart';
import 'package:crud_firebase/ui/2_categoria.dart';
import 'package:crud_firebase/ui/3.1_comida_saludable.dart';
import 'package:crud_firebase/ui/3.3_info_CS.dart';
import 'package:crud_firebase/ui/3.4_cancelar_CS.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';
import 'dart:async';
import 'package:crud_firebase/ui/2.2_comida_rapida.dart';
import 'package:crud_firebase/ui/2.3_info_CR.dart';

//lista de los roductos guardados

class ListaCS extends StatefulWidget {
  final ComidaS comidaS;
  ListaCS(this.comidaS);

  @override
  _ListaCSState createState() => _ListaCSState();
}

final productReference = FirebaseDatabase.instance.reference().child('ComidaS');
final cantpapaController = TextEditingController();

class _ListaCSState extends State<ListaCS> {
  List<ComidaS> items;
  String total2(sopa, batidos, ensaladas, fideos) {
    return (sopa + batidos + ensaladas + fideos).toString();
  }

  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangedSubscription =
        productReference.onChildAdded.listen(_onProductUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onProductAddedSubscription.cancel();
    _onProductChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'product db',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Categoria()),
                );
              }),
          title: Text('Productos cs  '),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12),
              itemBuilder: (context, position) {
                return Container(
                    child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _comidaRapida1(context, items[position]);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //tamaño del contenedor
                        height: 160,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[400]),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(15)),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteProduct(
                                          context, items[position], position)),
                                  //boton mostrar informacion
                                  IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blueAccent,
                                      ),
                                      onPressed: () => _informacionCS(
                                          context, items[position])),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amberAccent[100],
                                      radius: 17,
                                      child: Text(
                                        '${position + 1}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 21),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      'Total de Productos :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.lightBlueAccent[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(72, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    total2(
                                        int.parse(items[position].sopa),
                                        int.parse(items[position].batidos),
                                        int.parse(items[position].ensaladas),
                                        int.parse(items[position].fideos)),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.lightBlueAccent[400],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                              child: Row(
                                children: [
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.amberAccent[100])),
                                    color: Colors.amberAccent[100],
                                    textColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    onPressed: () =>
                                        _cancelarCS(context, items[position]),
                                    child: Text(
                                      "Cancelar".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
                //
              }),
        ),
        //

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightGreen,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => _comidasaludable(context, null),
                ),
                title: Text(
                  "Agregar",
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }),
                title: Text(
                  "Salir",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))
          ],
        ), //
      ),
    );
  }

  void _onProductAdded(Event event) {
    setState(() {
      items.add(new ComidaS.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new ComidaS.fromSnapShot(event.snapshot);
    });
  }

//boton eliminar
  void _deleteProduct(
      BuildContext context, ComidaS product, int position) async {
    await productReference.child(product.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

//dirige a la otra pantalla de list_product
  void _comidaRapida1(BuildContext context, ComidaS comidaS) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComidaSaludable(comidaS)),
    );
  }

  void _comidaRapida(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ComidaRapida(
              Product(null, '', '', '', '', '', '', '', '', '', '', '', ''))),
    );
  }

// boton mostrar informcaion
  void _informacionCS(BuildContext context, ComidaS comidaS) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformacionCS(comidaS)),
    );
  }

  void _cancelarCS(BuildContext context, ComidaS comidaS) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => cancelarCS(comidaS)),
    );
  }

//crear nuevo usuario
  void _comidasaludable(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ComidaSaludable(ComidaS(
                null,
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
              ))),
    );
  }
}
