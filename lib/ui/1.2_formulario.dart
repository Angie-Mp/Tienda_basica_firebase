import 'package:crud_firebase/model/tabla.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/ui/1_lista_form.dart';

//productos
class Formulario extends StatefulWidget {
  final Login login;
  Formulario(this.login);

  @override
  _FormularioState createState() => _FormularioState();
}

final productReference = FirebaseDatabase.instance.reference().child('Login');

class _FormularioState extends State<Formulario> {
  List<Product> items;

  TextEditingController _nombreController;
  TextEditingController _apellidoController;
  TextEditingController _telefonoController;
  TextEditingController _ntarjetaController;

  @override
  void initState() {
    super.initState();
    _nombreController = new TextEditingController(text: widget.login.nombre);
    _apellidoController =
        new TextEditingController(text: widget.login.apellido);
    _telefonoController =
        new TextEditingController(text: widget.login.telefono);
    _ntarjetaController =
        new TextEditingController(text: widget.login.ntarjeta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Registrarce',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(
                    'Datos Personales',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _nombreController,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Colors.grey[350])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Divider(),
                //
                //dos
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _apellidoController,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      labelText: 'Apellido',
                      labelStyle: TextStyle(color: Colors.grey[350])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Divider(),
                //
                //tres
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _telefonoController,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.call,
                        color: Colors.amber,
                      ),
                      labelText: 'Telefono',
                      labelStyle: TextStyle(color: Colors.grey[350])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Divider(),
                //
                //cuatro
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _ntarjetaController,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.table_chart,
                        color: Colors.amber,
                      ),
                      labelText: 'Nº de tarjeta',
                      labelStyle: TextStyle(color: Colors.grey[350])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Divider(),
                //
                Container(
                  padding: EdgeInsets.fromLTRB(25, 60, 25, 0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.amber)),
                      color: Colors.amberAccent[100],
                      textColor: Colors.black45,
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      onPressed: () {
                        if (widget.login.id != null) {
                        } else {
                          productReference.push().set({
                            "nombre": _nombreController.text,
                            "apellido": _apellidoController.text,
                            "telefono": _telefonoController.text,
                            "ntarjeta": _ntarjetaController.text,
                          }).then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Listadeformulario()),
                            );
                          });
                        }
                      },
                      child: (widget.login.id != null)
                          ? Text('Guardar Cambios')
                          : Text('Registrar')),
                ),
                //boton
              ],
            ),
          ),
        ],
      ),
    );
  }
}
