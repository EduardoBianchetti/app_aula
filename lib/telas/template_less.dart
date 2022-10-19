import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre o App"),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("App de aula"),
            Text("Protótipo com testes"),
          ],
        ),
      ),
    );
  }
}
