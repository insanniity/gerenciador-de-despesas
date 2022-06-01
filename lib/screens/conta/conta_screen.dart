import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/conta/components/body.dart';

class ContaScreen extends StatelessWidget {
  final int? id;
  const ContaScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(id: id,),
    );
  }
}
