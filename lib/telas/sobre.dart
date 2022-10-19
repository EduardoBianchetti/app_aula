import 'package:app_aula/telas/mais_info.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sobre o App"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("App de aula"),
            const Text("Protótipo com testes"),
            ElevatedButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Mais Info...'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MaisInfoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
