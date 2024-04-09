import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Usuario(), //relaciona o myapp ao usuario
    );
  }
}

class Usuario extends StatefulWidget {
  const Usuario({super.key});

  @override
  State<Usuario> createState() => _HomePageState();
}

class _HomePageState extends State<Usuario> {
  TextEditingController usuarioController = TextEditingController(); //cria a variavel para receber o usuario
  TextEditingController senhaController = TextEditingController(); //cria a variavel para receber o senha
  String _textoInfo = "Informe seus dados"; //cria uma variavel textoinfo e define um valor

  void _cadastro(){
    setState(() { //redefine o estado das variaveis
      String usuario = usuarioController.text; //transforma em dados do tipo string
      String senha = senhaController.text;

      if(usuario == "" || senha == ""){
        _textoInfo = "Informe corretamente os dados"; //diz que nenhum campo deve estar em branco, se estiver deve informar
      }
      else{ //se os campos nao estiverem em branco deve redefinir as variavis e informar cadastrado com sucesso
        usuarioController.text = "";
        senhaController.text = "";
        _textoInfo = "Usuario cadastrado com sucesso";
      }
    });
  }

  void _limpar_tela(){ //se esse metodo for acionado as variaveis serão redefinidas ao estado inicial
    usuarioController.text = "";
    senhaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar é o componente superior do aplicativo, contém a barra de ferramentas, titulo da pagina e alguns outros botões de ação comuns
        title: Text("Cadastro de Usuário"), //titulo
        centerTitle: true, //centraliza
        backgroundColor: Colors.blue.shade700, //cor
        actions: <Widget>[ //cria uma lista de elementos
          IconButton(
              onPressed: _limpar_tela, //relaciona o icone ao metodo limpartela
              icon: Icon(Icons.refresh)
          )
        ],
      ),

      body: SingleChildScrollView( //o body pode ser rolado
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //a coluna e os elementos ocuparao a tela inteira
          children: <Widget>[
            const Icon(
              Icons.person, //adiciona um icone
              size: 120.0, //tamanho
              color: Colors.blue, //cor
            ),
            TextField( //cria um campo de texto
              keyboardType: TextInputType.text, //aceita dados do tipo texto
              decoration: InputDecoration( //texto que aparece em cima do campo
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.black45)
              ),
              textAlign: TextAlign.center, //centraliza
              style: TextStyle(fontSize: 25.0), //tamanho da fonte do texto
              controller: usuarioController, //diz que os dados inseridos serao guardados na variavel usuarioController
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black45)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senhaController, //diz que os dados inseridos serao guardados na variavel senhaController
            ),
            Padding( //define um padding
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton( //adiciona um botao para cadastrar o usuario
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700, //cor do botao
                            textStyle: TextStyle(
                              fontSize: 25.5, //tamanho da fonte
                            )
                        ),
                        onPressed: _cadastro,
                        child: const Text("Cadastrar") //texto do botao
                    )
                )
            ),
            Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 25.0
                )
            )
          ],
        ),
      ),
    );
  }
}