import 'package:crud_firebase/ui/2.5_cerrar_secion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

// mostrar informacion del producto
class cancelarCS extends StatefulWidget {
  final ComidaS comidaS;
  cancelarCS(this.comidaS);
  @override
  _cancelarCSState createState() => _cancelarCSState();
}

final productReference = FirebaseDatabase.instance.reference().child('ComidaS');

class _cancelarCSState extends State<cancelarCS> {
  List<Product> items;
  int precio1 = 10;
  int precio2 = 15;
  int precio3 = 25;
  int precio4 = 35;
  //
  String total1(precio1, sopa) {
    return (precio1 * sopa).toString();
  }

  String total2(precio2, batidos) {
    return (precio2 * batidos).toString();
  }

  String total3(precio3, ensaladas) {
    return (precio3 * ensaladas).toString();
  }

  String total4(precio4, fideos) {
    return (precio4 * fideos).toString();
  }

  String total5(precio1, cantpapa, precio2, cantamburguesa, precio3, cantcombo,
      precio4, canttaco) {
    return (precio1 * cantpapa +
            precio2 * cantamburguesa +
            precio3 * cantcombo +
            precio4 * canttaco)
        .toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cancelar Productos',
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
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Image.asset(
                            'assets/sopa.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'SOPAS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.comidaS.sopa}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total1(precio1,
                                        int.parse(widget.comidaS.sopa)),
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '_______________________________________________',
                      style: TextStyle(color: Colors.grey[350]),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Image.asset(
                            'assets/batidos.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'BATIDOS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.comidaS.batidos}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total2(precio2,
                                        int.parse(widget.comidaS.batidos)),
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '_______________________________________________',
                      style: TextStyle(color: Colors.grey[350]),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Image.asset(
                            'assets/ensalada.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'ENSALADAS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.comidaS.ensaladas}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total3(precio3,
                                        int.parse(widget.comidaS.ensaladas)),
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '_______________________________________________',
                      style: TextStyle(color: Colors.grey[350]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Image.asset(
                      'assets/fideos.png',
                      height: 150,
                      width: 180,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                    child: Column(
                      children: [
                        Text(
                          'FIDEOS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Divider(),
                        Text(
                          'Porciones : ${widget.comidaS.fideos}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'precio: ' +
                              total4(precio4, int.parse(widget.comidaS.fideos)),
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 0, 30),
              child: Text(
                '_______________________________________________',
                style: TextStyle(color: Colors.grey[350]),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(80, 0, 0, 10),
                      child: Text(
                        'Total a Pagar : ' +
                            total5(
                                precio1,
                                int.parse(widget.comidaS.sopa),
                                precio2,
                                int.parse(widget.comidaS.batidos),
                                precio3,
                                int.parse(widget.comidaS.ensaladas),
                                precio4,
                                int.parse(widget.comidaS.fideos)),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(130, 0, 0, 30),
              child: Row(
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.red[400])),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => compra_hecha()));
                    },
                    child: Text(
                      "  Cancelar  ".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
