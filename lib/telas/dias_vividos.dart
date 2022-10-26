import 'package:app_aula/util/dialogos.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DiasVividosPage extends StatefulWidget {
  const DiasVividosPage({super.key, required this.title});
  final String title;
  @override
  State<DiasVividosPage> createState() => _DiasVividosPageState();
}

class _DiasVividosPageState extends State<DiasVividosPage> {
  int _idade = 0;
  String _nome = '';
  int _diasVividos = 0;

  void _calcular() {
    setState(() {
      _diasVividos = _idade * 365;
      entries.add('$_nome tem $_idade anos e viveu ~ $_diasVividos dias.');
    });
    Dialogos.showAlertDialog(context, 'Calculou dias vividos para $_nome');
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> entries = <String>[];
  final List<int> colorCodes = <int>[600, 100];

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
                  _nome = value;
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sua Idade...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua idade!';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Informe número na idade!';
                  }
                  _idade = int.tryParse(value)!;
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
              Text('$_nome, você viveu aproximadamente'),
              Text(
                '$_diasVividos dias.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Text('Dias que viveu +-'),
              TextFormField(
                keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Resultado',
                ),
                // usar key para detectar setState
                key: Key(_diasVividos.toString()),
                initialValue: _diasVividos.toString(),
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
                      child: Center(child: Text(entries[index])),
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
