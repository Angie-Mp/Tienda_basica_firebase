import 'package:crud_firebase/ui/1_lista_form.dart';
import 'package:crud_firebase/ui/1.2_formulario.dart';
import 'package:flutter/material.dart';
import 'model/tabla.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Listadeformulario()));
                    },
                    child: Column(
                      children: [
                        Text(
                          'Bienvenidos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Image.asset('assets/chef.png')
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

void _formularioregistro(BuildContext context, Product product) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Formulario(Login(null, '', '', '', ''))),
  );
}
