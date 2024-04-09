import 'dart:math'; //importa o dart math para poder fazer calculo

import 'package:flutter/material.dart'; //importa o material dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Imc(), //relaciona a classe myapp a classe imc
    );
  }
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _HomePageState(); //cria um estado para a classe imc
}

class _HomePageState extends State<Imc> {
  TextEditingController pesoController = TextEditingController(); //cria uma variavel para receber o peso
  TextEditingController alturaController = TextEditingController(); //cria uma variavel para receber a altura
  String _textoInfo = "Informe seus dados"; //cria uma variavel textoinfo e define um valor

  void _limpar_tela(){ //cria um metodo para limpar os dados da tela
    pesoController.text = ""; //define que quando clicar esse campo deve ficar em branco
    alturaController.text = ""; //define que quando clicar esse campo deve ficar em branco
    setState(() { //redefine o estado da variavel a como iniciou
      _textoInfo = "Informe seus dados";
    });
  }

  void _calcular_imc(){ //cria o metodo que calculara o imc
    setState(() { //redefine o estado das variaveis
      double peso = double.parse(pesoController.text); //transforma os textos em numeros para poder calcular
      double altura = double.parse(alturaController.text);
      double imc = peso / pow((altura/100), 2); //realiza o calculo do imc

      if (imc < 16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if (imc <= 18.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if(imc<=24.9){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if(imc<=29.9){
        _textoInfo = "Sobre peso (${imc})"; //a estrutura de decisao serve para definir o que aparecera no texto dependendo do valor do imc
      }
      else if(imc<=34.9){
        _textoInfo = "Obesidade grau 1 (${imc})";
      }
      else if(imc<=39.9){
        _textoInfo = "Obesidade grau 2 (${imc})";
      }
      else{
        _textoInfo = "Obesidade grau 3 (${imc})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar é o componente superior do aplicativo, contém a barra de ferramentas, titulo da pagina e alguns outros botões de ação comuns
        title: Text("Calculadora IMC"), //titulo
        centerTitle: true, //centraliza o titulo
        backgroundColor: Colors.blueAccent, //cor de fundo
        actions: <Widget>[//inicia uma lista de elementos filhos da appbar
          IconButton(
              onPressed: _limpar_tela, //relaciona o icone refresh ao metodo limpar tela
              icon: Icon(Icons.refresh)
          )
        ],
      ),


      body: SingleChildScrollView( //define que o body pode ser rolado
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), //posição
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //define que a coluna deve ser esticada e ocupar a tela toda um "width de 100%"
          children: <Widget>[ //inicia uma lista de filhos da coluna
            const Icon( //adiciona um icone
              Icons.person_outline,
              size: 120.0, //define o tamanho
              color: Colors.blueAccent, //define a cor
            ),
            TextField( //define um campo de texto onde se pode digitar os dados
              keyboardType: TextInputType.number, //define que o campo do aceita dados do tipo numero
              decoration: InputDecoration(
                  labelText: "PESO (KG)", //texto que aparece em cima do campo
                  labelStyle: TextStyle(color: Colors.blueAccent)
              ),
              textAlign: TextAlign.center, //centraliza o campo
              style: TextStyle(fontSize: 25.0),
              controller: pesoController, //diz que os dados inseridos serao guardados na variavel pesoController
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "ALTURA (CM)",
                  labelStyle: TextStyle(color: Colors.blueAccent)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController, //diz que os dados inseridos serao guardados na variavel alturaController
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10), //coloca um padding para a coluna
                child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton( //cria um botao que acionará o metodo calcularimc
                        onPressed: _calcular_imc,
                        child: const Text("Calcular")
                    )
                )
            ),
            Text(
                _textoInfo, //puxa a variavel ja criada textoinfo
                textAlign: TextAlign.center,
                style: TextStyle( //estiliza o campo de texto
                    color: Colors.blueAccent, //defie a cor
                    fontSize: 25.0 //define o tamanho da fonte
                )
            )
          ],
        ),
      ),
    );
  }
}
