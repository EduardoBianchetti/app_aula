import 'package:flutter/material.dart';

class Pessoa {
  late String _nome = "";
  late double _peso = 0;
  late double _altura = 0;

  Pessoa();

  Pessoa.iniAll(this._nome, this._peso, this._altura);

  double getIMC() {
    return (_peso / (_altura * _altura));
  }

  String getInterpretacao(double _resultado) {
    if (_resultado < 18.5) {
      return 'Magreza';
    } else if (_resultado >= 18.5 && _resultado < 25) {
      return 'Normal';
    } else if (_resultado >= 25 && _resultado < 30) {
      return 'Sobrepeso';
    } else if (_resultado >= 30 && _resultado < 40) {
      return 'Obesidade';
    } else {
      return 'Obesidade Grave';
    }
  }

  String getResultado() {
    return '$_nome com peso de: $_peso KG e altura de: $altura, possui o IMC de ${this.getIMC().toString()}.';
  }

  // getters and setters
  String get nome {
    return _nome;
  }

  set nome(String nome) {
    _nome = nome;
  }

  double get peso {
    return _peso;
  }

  set peso(double peso) {
    _peso = peso;
  }

  double get altura {
    return _altura;
  }

  set altura(double altura) {
    _altura = altura;
  }
}
