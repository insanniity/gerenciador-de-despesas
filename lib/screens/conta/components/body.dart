import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/models/conta.dart';
import 'package:gerenciadordedespesas/models/transacao.dart';
import 'package:gerenciadordedespesas/screens/components/card_conta.dart';
import 'package:gerenciadordedespesas/screens/components/card_transacao.dart';
import 'package:gerenciadordedespesas/services/conta_service.dart';
import 'package:gerenciadordedespesas/services/transacao_service.dart';

import '../../transacao/transacao_screen.dart';

class Body extends StatefulWidget {
  final int? id;

  const Body({Key? key, required this.id}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TransacaoService ts = TransacaoService();
  ContaService cs = ContaService();
  late Future<List> _loadTransacoes;
  late Future<Conta> _loadConta;
  late Conta _conta;
  late List<Transacao> _transacoes;

  @override
  void initState() {
    _loadTransacoes = _getTransacoes(widget.id);
    _loadConta = _getConta(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 67, bottom: 16),
          child: Container(
            height: 175,
            width: double.infinity,
            child: FutureBuilder(
              future: _loadConta,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _conta = snapshot.data;
                  return cardConta(context, _conta);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Todas as transações',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: _loadTransacoes,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _transacoes = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _transacoes.length,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index){
                        return cardTransacao(context, index, _transacoes[index]);
                      }
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  Future<List> _getTransacoes(int? id) async {
    return await ts.getTransacoesConta(id);
  }

  Future<Conta> _getConta(int? id) async {
    return await cs.getConta(id);
  }
}
