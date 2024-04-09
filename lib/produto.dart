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
      home: const Produto(), //relaciona o myapp ao produto
    );
  }
}

class Produto extends StatefulWidget {
  const Produto({super.key});

  @override
  State<Produto> createState() => _HomePageState();
}

class _HomePageState extends State<Produto> {
  TextEditingController codigoController = TextEditingController(); //cria a variavel para receber o codigo
  TextEditingController descricaoController = TextEditingController(); //cria a variavel para receber a descricao
  TextEditingController precoController = TextEditingController(); //cria a variavel para receber o preco
  String _textoInfo = "Informe seus dados"; //cria uma variavel textoinfo e define um valor

  void _cadastro(){
    setState(() { //redefine o estado das variaveis
      String codigo = codigoController.text; //transforma em dados do tipo string
      String descricao = descricaoController.text;
      String preco = precoController.text;

      if(codigo == "" || descricao == "" || preco == ""){ //diz que nenhum campo deve estar em branco, se estiver deve informar
        _textoInfo = "Informe corretamente os dados";
      }
      else{ //se os campos nao estiverem em branco deve redefinir as variavis e informar cadastrado com sucesso
        codigoController.text = "";
        descricaoController.text = "";
        precoController.text = "";
        _textoInfo = "Produto cadastrado com sucesso";
      }
    });
  }

  void _limpar_tela(){ //se esse metodo for acionado as variaveis serão redefinidas ao estado inicial
    codigoController.text = "";
    descricaoController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "Informe os dados";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar é o componente superior do aplicativo, contém a barra de ferramentas, titulo da pagina e alguns outros botões de ação comuns
        title: Text("Cadastro de Produto"), //titulo
        centerTitle: true,//centralizar
        backgroundColor: Colors.lightBlueAccent, //cor de fundo
        actions: <Widget>[ //lista de elementos que estarao na appbar
          IconButton(
              onPressed: _limpar_tela, //relaciona o icone refresh ao limpar tela
              icon: Icon(Icons.refresh)
          )
        ],
      ),

      body: SingleChildScrollView( //a pagina do body pode ser rolado
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //a coluna tem um width de 100%
          children: <Widget>[ //lista de filhos da coluna
            const Icon(
              Icons.shopping_bag, //adiciona um icone
              size: 120.0, //tamanho do icone
              color: Colors.lightBlueAccent, // cor do icone
            ),
            TextField( //cria um campo de texto
              keyboardType: TextInputType.text, //aceita dados do tipo texto
              decoration: InputDecoration( //texto que aparece em cima do campo
                  labelText: "Codigo",
                  labelStyle: TextStyle(color: Colors.black45)
              ),
              textAlign: TextAlign.center, //centraliza
              style: TextStyle(fontSize: 25.0), //tamanho da fonte do texto
              controller: codigoController, //diz que os dados inseridos serao guardados na variavel codigoController
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Descrição",
                  labelStyle: TextStyle(color: Colors.black45)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: descricaoController, //diz que os dados inseridos serao guardados na variavel descriçãoController
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Preco",
                  labelStyle: TextStyle(color: Colors.black45)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: precoController, //diz que os dados inseridos serao guardados na variavel precoController
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10), //define um padding
                child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton( //adiciona um botao para cadastrar o produto
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent, //cor do botao
                            textStyle: TextStyle( //tamanho da fonte
                              fontSize: 25.5,
                            )
                        ),
                        onPressed: _cadastro, //quando acionado se relaciona ao metodo cadastro
                        child: const Text("Cadastrar") //texto do botao
                    )
                )
            ),
            Text(
                _textoInfo,
                textAlign: TextAlign.center, //centraliza o texto
                style: TextStyle(
                    color: Colors.lightBlueAccent, //define a cor
                    fontSize: 25.0 //tamanho da fonte
                )
            )
          ],
        ),
      ),
    );
  }
}