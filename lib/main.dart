import 'package:app_aula/telas/contador.dart';
import 'package:app_aula/telas/dias_vividos.dart';
import 'package:app_aula/telas/home.dart';
import 'package:app_aula/telas/sobre.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/contador': (context) => const ContadorPage(title: "Contador"),
        '/sobre': (context) => const SobrePage(),
        '/diasVividos': (context) =>
            const DiasVividosPage(title: "Dias Vividos"),
      },
    );
  }
}
