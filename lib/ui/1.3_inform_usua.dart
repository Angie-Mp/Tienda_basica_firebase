import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

// mostrar informacion del producto
class InformacionUsuario extends StatefulWidget {
  final Product product;
  InformacionUsuario(this.product);
  @override
  _InformacionUsuarioState createState() => _InformacionUsuarioState();
}

final productReference =
    FirebaseDatabase.instance.reference().child('product').child('Registro');

class _InformacionUsuarioState extends State<InformacionUsuario> {
  List<Product> items;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Informacion del Usuario',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(40, 80, 0, 20),
                          child: Text(
                            'Nombre :',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 80, 0, 20),
                          child: Text(
                            '${widget.product.nombre}',
                            style: TextStyle(
                                fontSize: 20, color: Colors.amber[800]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
              child: Text(
                '_______________________________________________',
                style: TextStyle(color: Colors.grey[350]),
              ),
            ), //

            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 30, 0, 20),
                    child: Text(
                      'Apellido :',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 20),
                    child: Text(
                      '${widget.product.apellido}',
                      style: TextStyle(fontSize: 20, color: Colors.amber[800]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
              child: Text(
                '_______________________________________________',
                style: TextStyle(color: Colors.grey[350]),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 30, 0, 20),
                    child: Text(
                      'Telefono :',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 20),
                    child: Text(
                      '${widget.product.telefono}',
                      style: TextStyle(fontSize: 20, color: Colors.amber[800]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
              child: Text(
                '_______________________________________________',
                style: TextStyle(color: Colors.grey[350]),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 30, 0, 20),
                    child: Text(
                      'Nº Tarjeta :',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 20),
                    child: Text(
                      '${widget.product.ntarjeta}',
                      style: TextStyle(fontSize: 20, color: Colors.amber[800]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
