import 'package:flutter/material.dart'; //serve para importa o material dart
import 'tela1.dart'; //serve para importar a tela1

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){ //define que o programa deve ir direto para a tela1 quando inicializar
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tela1(),
    );
  }
}