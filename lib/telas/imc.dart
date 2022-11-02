import 'package:app_aula/model/Pessoa.dart';
import 'package:app_aula/util/dialogos.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key, required this.title});
  final String title;
  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  Pessoa obj = Pessoa();
  final List<Pessoa> entries = <Pessoa>[];
  final List<int> colorCodes = <int>[600, 100];
  final _formKey = GlobalKey<FormState>();

  void _calcular() {
    Dialogos.showAlertDialog(context, 'Calculou IMC para ${obj.nome}');

    setState(() {
      entries.add(Pessoa.iniAll(obj.nome, obj.peso, obj.altura));
    });
  }

  void _limpar() {
    setState(() {
      entries.clear();
    });
    GFToast.showToast(
      'Limpou os dados.',
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // Adicionar aqui as Widgets para o Form
              TextFormField(
                keyboardType: TextInputType.text,
                maxLength: 50,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Seu Nome...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu nome!';
                  }
                  obj.nome = value;
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Seu Peso...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu Peso!';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe número no peso!';
                  }
                  obj.peso = double.tryParse(value)!;
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sua Altura...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua Altura!';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe número na altura!';
                  }
                  obj.altura = double.tryParse(value)!;
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calcular();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calculado com Sucesso!')),
                    );
                  }
                },
                child: const Text('Calcular'),
              ),
              ElevatedButton(
                onPressed: () {
                  Dialogos.showConfirmDialog(context, 'Confirma?', _limpar);
                },
                child: const Text('Limpar'),
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber[colorCodes[index % 2 == 0 ? 0 : 1]],
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 70.0,
                              child: Text(entries[index].nome),
                            ),
                            SizedBox(
                              width: 70.0,
                              child: Text(entries[index].altura.toString()),
                            ),
                            SizedBox(
                              width: 70.0,
                              child: Text(entries[index].peso.toString()),
                            ),
                            SizedBox(
                              width: 70.0,
                              child: Text(entries[index].getIMC().toString()),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: Text(entries[index]
                                  .getInterpretacao(entries[index].peso /
                                      (entries[index].altura *
                                          entries[index].altura))
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
