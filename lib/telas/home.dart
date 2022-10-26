import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'App Aula',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_business_outlined),
              title: const Text('Contador'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/contador');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_sharp),
              title: const Text('Dias Vividos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/diasVividos');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage('images/upf.png'),
            ),
            const Text("Bem vindo ao app"),
            const Text("Protótipo de testes"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/contador');
              },
              child: const Text("Contador"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sobre');
              },
              child: const Text("Sobre"),
            ),
          ],
        ),
      ),
    );
  }
}
