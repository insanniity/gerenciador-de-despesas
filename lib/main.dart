import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/cadastrar_conta/cadastrar_conta_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: CadastrarContaScreen(),
    );
  }
}
