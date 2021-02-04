import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';
import 'package:crud_firebase/ui/2.1_lista_CR.dart';

//productos
class ComidaRapida extends StatefulWidget {
  final Product product;
  ComidaRapida(this.product);

  @override
  _ComidaRapidaState createState() => _ComidaRapidaState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ComidaRapidaState extends State<ComidaRapida> {
  List<Product> items;
  int precio1 = 12;
  int precio2 = 15;
  int precio3 = 55;
  int precio4 = 12;
  TextEditingController _cantpapaController;
  TextEditingController _cantamburguesaController;
  TextEditingController _cantcomboController;
  TextEditingController _canttacoController;

  @override
  void initState() {
    super.initState();
    _cantpapaController =
        new TextEditingController(text: widget.product.cantpapa);

    _cantamburguesaController =
        new TextEditingController(text: widget.product.cantamburguesa);
    _cantcomboController =
        new TextEditingController(text: widget.product.cantcombo);
    _canttacoController =
        new TextEditingController(text: widget.product.canttaco);
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
                          'assets/papas.png',
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
                    controller: _cantpapaController,
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
                          'assets/amburguesa.png',
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
                    controller: _cantamburguesaController,
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
                          'assets/combo.png',
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
                    controller: _cantcomboController,
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
                          'assets/taco.png',
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
                    controller: _canttacoController,
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
                      if (widget.product.id != null) {
                        //guardar cambios
                        productReference.push().set({
                          "cantpapa": _cantpapaController.text,
                          "cantamburguesa": _cantamburguesaController.text,
                          "cantcombo": _cantcomboController.text,
                          "canttaco": _canttacoController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        //registrar
                        productReference.push().set({
                          "cantpapa": _cantpapaController.text,
                          "cantamburguesa": _cantamburguesaController.text,
                          "cantcombo": _cantcomboController.text,
                          "canttaco": _canttacoController.text,
                        }).then((_) {
                          Navigator.pop(
                            context,
                          );
                        });
                      }
                    },
                    child: (widget.product.id != null)
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
