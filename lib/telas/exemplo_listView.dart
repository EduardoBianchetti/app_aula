import 'package:app_aula/model/DiasVividos.dart';
import 'package:flutter/material.dart';
import '../util/dialogos.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key, required this.title});
  final String title;
  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<DiasVividos> lista = <DiasVividos>[];

  void _criarObjeto() {
    setState(() {
      lista.add(
          DiasVividos.iniAll('Pessoa ${lista.length + 1}', lista.length + 10));
    });
  }

  selecionou(DiasVividos selecao) {
    Dialogos.showAlertDialog(context, 'Selecionou ${selecao.nome}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.vertical,
          children: lista
              .map((obj) => ListTile(
                    leading: Icon(Icons.person),
                    title: Row(children: [
                      SizedBox(width: 130, child: Text(obj.nome)),
                      Text('Viveu +- ${obj.getDiasVividos()} dias.'),
                    ]),
                    onTap: () => selecionou(obj),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _criarObjeto,
        tooltip: 'Criar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
