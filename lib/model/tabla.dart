import 'package:firebase_database/firebase_database.dart';

//tabla 1
class Login {
  String _id;
  String _nombre;
  String _apellido;
  String _telefono;
  String _ntarjeta;

  Login(
    this._id,
    this._nombre,
    this._apellido,
    this._telefono,
    this._ntarjeta,
  );

  Login.map(dynamic obj) {
    this._nombre = obj['nombre'];
    this._apellido = obj['apellido'];
    this._telefono = obj['telefono'];
    this._ntarjeta = obj['ntarjeta'];
  }

  String get id => _id;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get telefono => _telefono;
  String get ntarjeta => _ntarjeta;

  Login.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _apellido = snapshot.value['apellido'];
    _telefono = snapshot.value['telefono'];
    _ntarjeta = snapshot.value['ntarjeta'];
  }
}

//tabla 2
class Product {
  String _id;
  String _nombre;
  String _apellido;
  String _telefono;
  String _ntarjeta;
  String _cantpapa;
  String _cantamburguesa;
  String _cantcombo;
  String _canttaco;
  String _precio1;
  String _precio2;
  String _precio3;
  String _precio4;

  Product(
      this._id,
      this._nombre,
      this._apellido,
      this._telefono,
      this._ntarjeta,
      this._cantpapa,
      this._cantamburguesa,
      this._cantcombo,
      this._canttaco,
      this._precio1,
      this._precio2,
      this._precio3,
      this._precio4);

  Product.map(dynamic obj) {
    this._nombre = obj['nombre'];
    this._apellido = obj['apellido'];
    this._telefono = obj['telefono'];
    this._ntarjeta = obj['ntarjeta'];
    this._cantpapa = obj['cantpapa'];
    this._cantamburguesa = obj['cantamburguesa'];
    this._cantcombo = obj['cantcombo'];
    this._canttaco = obj['canttaco'];
    this._precio1 = obj['precio1'];
    this._precio2 = obj['precio2'];
    this._precio3 = obj['precio3'];
    this._precio4 = obj['precio4'];
  }

  String get id => _id;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get telefono => _telefono;
  String get ntarjeta => _ntarjeta;
  String get cantpapa => _cantpapa;
  String get cantamburguesa => _cantamburguesa;
  String get cantcombo => _cantcombo;
  String get canttaco => _canttaco;
  String get precio1 => _precio1;
  String get precio2 => _precio2;
  String get precio3 => _precio3;
  String get precio4 => _precio4;

  Product.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _apellido = snapshot.value['apellido'];
    _telefono = snapshot.value['telefono'];
    _ntarjeta = snapshot.value['ntarjeta'];
    _cantpapa = snapshot.value['cantpapa'];
    _cantamburguesa = snapshot.value['cantamburguesa'];
    _cantcombo = snapshot.value['cantcombo'];
    _canttaco = snapshot.value['canttaco'];
    _precio1 = snapshot.value['precio1'];
    _precio2 = snapshot.value['precio2'];
    _precio3 = snapshot.value['precio3'];
    _precio4 = snapshot.value['precio4'];
  }
}

//tabla 3
class ComidaS {
  String _id;
  String _sopa;
  String _batidos;
  String _ensaladas;
  String _fideos;

  String _precio1;
  String _precio2;
  String _precio3;
  String _precio4;

  ComidaS(this._id, this._sopa, this._batidos, this._ensaladas, this._fideos,
      this._precio1, this._precio2, this._precio3, this._precio4);

  ComidaS.map(dynamic obj) {
    this._sopa = obj['sopa'];
    this._batidos = obj['batidos'];
    this._ensaladas = obj['ensaladas'];
    this._fideos = obj['fideos'];

    this._precio1 = obj['precio1'];
    this._precio2 = obj['precio2'];
    this._precio3 = obj['precio3'];
    this._precio4 = obj['precio4'];
  }

  String get id => _id;
  String get sopa => _sopa;
  String get batidos => _batidos;
  String get ensaladas => _ensaladas;
  String get fideos => _fideos;

  String get precio1 => _precio1;
  String get precio2 => _precio2;
  String get precio3 => _precio3;
  String get precio4 => _precio4;

  ComidaS.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _sopa = snapshot.value['sopa'];
    _batidos = snapshot.value['batidos'];
    _ensaladas = snapshot.value['ensaladas'];
    _fideos = snapshot.value['fideos'];

    _precio1 = snapshot.value['precio1'];
    _precio2 = snapshot.value['precio2'];
    _precio3 = snapshot.value['precio3'];
    _precio4 = snapshot.value['precio4'];
  }
}
