import 'package:crud_firebase/main.dart';
import 'package:crud_firebase/ui/1.2_formulario.dart';
import 'package:crud_firebase/ui/2_categoria.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';
import 'dart:async';
import 'package:crud_firebase/ui/1.3_inform_usua.dart';

//lista de los roductos guardados

class Listadeformulario extends StatefulWidget {
  @override
  _ListadeformularioState createState() => _ListadeformularioState();
}

final productReference = FirebaseDatabase.instance.reference().child('Login');

class _ListadeformularioState extends State<Listadeformulario> {
  List<Product> items;
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
          title: Text('Usuarios Registrados'),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Categoria()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //tamaño del contenedor
                        height: 140,
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
                                      onPressed: () => _informacionUsuario(
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
                                      '${items[position].nombre}',
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
                                    '${items[position].apellido}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.lightBlueAccent[400],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
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
                  onPressed: () => _formulario(context, null),
                ),
                title: Text(
                  "Agregar",
                  style: TextStyle(color: Colors.white, fontSize: 13),
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
      items.add(new Product.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Product.fromSnapShot(event.snapshot);
    });
  }

//boton eliminar
  void _deleteProduct(
      BuildContext context, Product product, int position) async {
    await productReference.child(product.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

//

// boton mostrar informcaion
  void _informacionUsuario(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformacionUsuario(product)),
    );
  }
}

void _formulario(BuildContext context, Product product) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Formulario(Login(null, '', '', '', ''))),
  );
}
