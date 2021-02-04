import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/model/tabla.dart';

// mostrar informacion del producto
class InformacionCS extends StatefulWidget {
  final ComidaS comidaS;
  InformacionCS(this.comidaS);
  @override
  _InformacionCState createState() => _InformacionCState();
}

final productReference =
    FirebaseDatabase.instance.reference().child('comidaS').child('product');

class _InformacionCState extends State<InformacionCS> {
  List<ComidaS> items;
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
              DataCell(Text("Sopas")),
              DataCell(Text(" ${widget.comidaS.sopa}")),
              DataCell(Text(total1(precio1, int.parse(widget.comidaS.sopa))))
            ]),
            DataRow(cells: [
              DataCell(Text("Batidos")),
              DataCell(Text(" ${widget.comidaS.batidos}")),
              DataCell(Text(total2(precio2, int.parse(widget.comidaS.batidos))))
            ]),
            DataRow(cells: [
              DataCell(Text("Ensaladas")),
              DataCell(Text(" ${widget.comidaS.ensaladas}")),
              DataCell(
                  Text(total3(precio3, int.parse(widget.comidaS.ensaladas))))
            ]),
            DataRow(cells: [
              DataCell(Text("Fideos")),
              DataCell(Text(" ${widget.comidaS.fideos}")),
              DataCell(Text(total4(precio4, int.parse(widget.comidaS.fideos))))
            ]),
          ],
        ),
      ),
    );
  }
}
