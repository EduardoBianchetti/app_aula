import 'package:flutter/material.dart';

class MaisInfoPage extends StatelessWidget {
  const MaisInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mais info do App"),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("Tela com mais informações..."),
            Text("Protótipo com testes"),
          ],
        ),
      ),
    );
  }
}
