import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';
import 'package:crud_firebase/ui/2.1_lista_CR.dart';

//productos
class ComidaSaludable extends StatefulWidget {
  final ComidaS comidaS;
  ComidaSaludable(this.comidaS);

  @override
  _ComidaSaludableState createState() => _ComidaSaludableState();
}

final productReference = FirebaseDatabase.instance.reference().child('ComidaS');

class _ComidaSaludableState extends State<ComidaSaludable> {
  List<ComidaS> items;
  int precio1 = 10;
  int precio2 = 15;
  int precio3 = 25;
  int precio4 = 35;
  TextEditingController _sopaController;
  TextEditingController _batidosController;
  TextEditingController _ensaladasController;
  TextEditingController _fideosController;

  @override
  void initState() {
    super.initState();
    _sopaController = new TextEditingController(text: widget.comidaS.sopa);

    _batidosController =
        new TextEditingController(text: widget.comidaS.batidos);
    _ensaladasController =
        new TextEditingController(text: widget.comidaS.ensaladas);
    _fideosController = new TextEditingController(text: widget.comidaS.fideos);
  }

//funcion que sume todo los valores , for ,se guarda dentro de una variable1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Productos',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                //uno
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/sopa.png',
                          width: 180,
                          height: 180,
                        ),
                        Text(
                          "Precio: ${precio1}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),

                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _sopaController,
                    style:
                        TextStyle(fontSize: 17, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber)),
                    ),
                  ),
                ), //
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    '_______________________________________________',
                    style: TextStyle(color: Colors.grey[350]),
                  ),
                ), //
                //dos
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/batidos.png',
                          width: 180,
                          height: 180,
                        ),
                        Text(
                          "Precio: ${precio2}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),

                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _batidosController,
                    style:
                        TextStyle(fontSize: 17, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber)),
                    ),
                  ),
                ), //
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    '_______________________________________________',
                    style: TextStyle(color: Colors.grey[350]),
                  ),
                ), //
                //tres
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/ensalada.png',
                          width: 180,
                          height: 180,
                        ),
                        Text(
                          "Precio: ${precio3}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),

                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _ensaladasController,
                    style:
                        TextStyle(fontSize: 17, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber)),
                    ),
                  ),
                ), //
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    '_______________________________________________',
                    style: TextStyle(color: Colors.grey[350]),
                  ),
                ), //
                //cuaro
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fideos.png',
                          width: 140,
                          height: 140,
                        ),
                        Text(
                          "Precio: ${precio4}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),

                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _fideosController,
                    style:
                        TextStyle(fontSize: 17, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                      labelText: 'Cantidad',
                      labelStyle: TextStyle(color: Colors.grey[350]),
                      enabledBorder: new OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.amber)),
                    ),
                  ),
                ), //
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    '_______________________________________________',
                    style: TextStyle(color: Colors.grey[350]),
                  ),
                ), //

                //boton
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.amber)),
                    color: Colors.amberAccent[100],
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    onPressed: () {
                      if (widget.comidaS.id != null) {
                        //guardar cambios
                        productReference.push().set({
                          "sopa": _sopaController.text,
                          "batidos": _batidosController.text,
                          "ensaladas": _ensaladasController.text,
                          "fideos": _fideosController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        //registrar
                        productReference.push().set({
                          "sopa": _sopaController.text,
                          "batidos": _batidosController.text,
                          "ensaladas": _ensaladasController.text,
                          "fideos": _fideosController.text,
                        }).then((_) {
                          Navigator.pop(
                            context,
                          );
                        });
                      }
                    },
                    child: (widget.comidaS.id != null)
                        ? Text(
                            'Guardar Cambio',
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            'Agregar',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
              ],
            ),
          )
          //
        ],
      ),
    );
  }
}
