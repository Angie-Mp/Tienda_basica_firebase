import 'package:crud_firebase/ui/2.5_cerrar_secion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

// mostrar informacion del producto
class cancelar extends StatefulWidget {
  final Product product;
  cancelar(this.product);
  @override
  _cancelarState createState() => _cancelarState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _cancelarState extends State<cancelar> {
  List<Product> items;
  int precio1 = 12;
  int precio2 = 15;
  int precio3 = 55;
  int precio4 = 12;
  //
  String total1(precio1, cantpapa) {
    return (precio1 * cantpapa).toString();
  }

  String total2(precio2, cantamburguesa) {
    return (precio2 * cantamburguesa).toString();
  }

  String total3(precio3, cantcombo) {
    return (precio3 * cantcombo).toString();
  }

  String total4(precio4, canttaco) {
    return (precio4 * canttaco).toString();
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
                            'assets/papas.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'PAPAS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.product.cantpapa}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total1(precio1,
                                        int.parse(widget.product.cantpapa)),
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
                            'assets/amburguesa.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'AMBURGUESAS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.product.cantamburguesa}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total2(
                                        precio2,
                                        int.parse(
                                            widget.product.cantamburguesa)),
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
                            'assets/combo.png',
                            height: 180,
                            width: 180,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                          child: Column(
                            children: [
                              Text(
                                'COMBOS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Divider(),
                              Text(
                                'Porciones : ${widget.product.cantcombo}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'precio: ' +
                                    total3(precio3,
                                        int.parse(widget.product.cantcombo)),
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
                      'assets/taco.png',
                      height: 150,
                      width: 180,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(18, 0, 0, 8),
                    child: Column(
                      children: [
                        Text(
                          'TACOS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Divider(),
                        Text(
                          'Porciones : ${widget.product.canttaco}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'precio: ' +
                              total4(
                                  precio4, int.parse(widget.product.canttaco)),
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
                                int.parse(widget.product.cantpapa),
                                precio2,
                                int.parse(widget.product.cantamburguesa),
                                precio3,
                                int.parse(widget.product.cantcombo),
                                precio4,
                                int.parse(widget.product.canttaco)),
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
