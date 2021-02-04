import 'package:crud_firebase/main.dart';
import 'package:crud_firebase/ui/2_categoria.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class compra_hecha extends StatelessWidget {
  final Widget child;
  const compra_hecha({Key key, this.child}) : super(key: key); //termina
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutte '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override //la pare visual
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 180, 5),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.lightGreen,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text(
                " Cerrar Secion ",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 120, 40, 5),
            child: Text(
              'Gracias por su Compra',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 20),
            child: Image.asset(
              'assets/check.png',
              width: 120,
              height: 120,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(90, 40, 85, 5),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  side: BorderSide(color: Colors.white)),
              color: Colors.lightGreen,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categoria()));
              },
              child: Text(
                "  Regresar al Menu   ",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
