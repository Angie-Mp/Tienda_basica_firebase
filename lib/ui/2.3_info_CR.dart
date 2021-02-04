import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

// mostrar informacion del producto
class InformacionCR extends StatefulWidget {
  final Product product;
  InformacionCR(this.product);
  @override
  _InformacionCRState createState() => _InformacionCRState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _InformacionCRState extends State<InformacionCR> {
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productos elegidos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        height: 0,
        padding: const EdgeInsets.all(20),
        child: DataTable(
          sortColumnIndex: 1,
          sortAscending: false,
          columns: [
            DataColumn(
                label: Text(
              "Poducto",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            DataColumn(
                label: Text(
                  "cantidad",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                numeric: true),
            DataColumn(
                label: Text(
                  "precio",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                numeric: true),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("Papas")),
              DataCell(Text(" ${widget.product.cantpapa}")),
              DataCell(
                  Text(total1(precio1, int.parse(widget.product.cantpapa))))
            ]),
            DataRow(cells: [
              DataCell(Text("Amburguesa")),
              DataCell(Text(" ${widget.product.cantamburguesa}")),
              DataCell(Text(
                  total2(precio2, int.parse(widget.product.cantamburguesa))))
            ]),
            DataRow(cells: [
              DataCell(Text("Combo")),
              DataCell(Text(" ${widget.product.cantcombo}")),
              DataCell(
                  Text(total3(precio3, int.parse(widget.product.cantcombo))))
            ]),
            DataRow(cells: [
              DataCell(Text("Taco")),
              DataCell(Text(" ${widget.product.canttaco}")),
              DataCell(
                  Text(total4(precio4, int.parse(widget.product.canttaco))))
            ]),
          ],
        ),
      ),
    );
  }
}
