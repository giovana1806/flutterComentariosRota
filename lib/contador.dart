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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade100),
        useMaterial3: true,
      ),
      home: const Contador(), //relaciona o appbar ao contador
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Contador> {
  int _counter = 0; //inicia um metodo contador

  void _incrementCounter() {
    setState(() {
      _counter++; //metodo para adicionar
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--; //metodo para subtrair
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar é o componente superior do aplicativo, contém a barra de ferramentas, titulo da pagina e alguns outros botões de ação comuns
        backgroundColor: Colors.lightBlue.shade100, //cor
        title: Text('Contador'),//titulo
      ),
      body: Center( //centraliza o body
        child: Column( //os elementos se apresentarao em forma de coluna
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ //cria uma lista de elementos
            const Text(
              'Voce apertou o botão tantas vezes:', //adiciona um texto
            ),
            Text(
              '$_counter', //mostra o metodo contador como um texto
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row( //coloca os elementos em forma de linha
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //arruma a centralização dos elementos
                children: <Widget>[ //lista de elmentos
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue.shade100), //define cor
                      onPressed: _incrementCounter, child: const Icon(Icons.add)), //aciona o metodo  de adicionar o contador
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue.shade100), //define a cor
                      onPressed: _decrementCounter, child: const Icon(Icons.remove)), //aciona o metodo de subtrair o contador
                ]
            )
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
