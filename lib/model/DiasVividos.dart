import 'package:flutter/material.dart';

class DiasVividos {
  late String _nome = '';
  late int _idade = 0;

  DiasVividos();

  DiasVividos.iniAll(this._nome, this._idade);

  DiasVividos.iniNome(String nome) {
    this._idade = 0;
  }

  int getDiasVividos() {
    return _idade * 365;
  }

  String getResultado() {
    return '$_nome viveu aproximadamente +- ${this.getDiasVividos().toString()} dias.';
  }

  // getters and setters
  String get nome {
    return _nome;
  }

  set nome(String nome) {
    _nome = nome;
  }

  int get idade {
    return _idade;
  }

  set idade(int idade) {
    _idade = idade;
  }

  void _testarObjetos() {
    final List<DiasVividos> lista = <DiasVividos>[];
    // instanciando e acessando atributos por get e set
    DiasVividos objeto = DiasVividos();
    objeto.nome = 'Pessoa um';
    objeto.idade = 25;
    lista.add(objeto);
    // instanciando usando construtores
    lista.add(DiasVividos.iniAll('Pessoa dois', 20));
    lista.add(DiasVividos.iniNome('Pessoa tres'));
    // mensagens para métodos
    debugPrint(objeto.getResultado());
    for (var o in lista) {
      debugPrint(o.getResultado());
    }
  }
}
