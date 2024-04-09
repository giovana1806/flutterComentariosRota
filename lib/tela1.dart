import 'package:flutter/material.dart'; //importa o material dart
import 'imc.dart'; //importa a pagina imc
import 'contador.dart'; //importa a pagina contador
import 'produto.dart'; //importa a pagina produto
import 'usuario.dart'; //importa a pagina usuario

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( //appbar é o componente superior do aplicativo, contém a barra de ferramentas, titulo da pagina e alguns outros botões de ação comuns
        title: const Text('MENU'),//titulo
        centerTitle: true,//centralizar o titulo
        backgroundColor: Colors.indigo,//define a cor de fundo da appbar
      ),

      body: SingleChildScrollView( //define que o body pode ser rolado
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),//define a posição
        child: Column( //os elementos que estão aqui dentro ficarão podicionados em forma de coluna
          crossAxisAlignment: CrossAxisAlignment.stretch,//define que a coluna deve ser esticada e ocupar a tela toda um "width de 100%"
          children: <Widget>[ //inicia uma lista de elementos filhos da coluna
            const Icon(
              Icons.add_business_sharp, //adiciona o icone na tela
              size: 120.0,
              color: Colors.indigo,
            ),
            const Text(
              'Aplicação Principal', //adiciona um texto na pagina
              textAlign: TextAlign.center,//centraliza o texto
              style: TextStyle(fontSize: 25), //define o tamanho da fonte do texto
            ),
            ElevatedButton( //cria um botao que leva para a pagina imc
              child: const Text('IMC'), //texto do botao
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Imc()), //define a rota para a pagina imc
                );
              },
            ),
            ElevatedButton( //cria um botao que leva a pagina contador
              child: const Text('Contador'), //texto do botao
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contador()),//define a rota
                );
              },
            ),
            ElevatedButton( //cria um botao que leva a pagina de cadastro dos usuarios
              child: const Text('Cadastro Usuario'), //texto do botao
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Usuario()), //define a rota
                );
              },
            ),
            ElevatedButton( //cria um botao que leva a pagina de cadastro dos produtos
              child: const Text('Cadastro Produto'), //texto do botao
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Produto()), //define a rota
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}