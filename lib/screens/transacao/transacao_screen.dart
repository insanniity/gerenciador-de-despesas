import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/transacao/components/body.dart';

class TransacaoScreen extends StatelessWidget {
  const TransacaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Todas as transações"),
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
