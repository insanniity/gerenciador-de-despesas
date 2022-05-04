import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/home/components/card_conta.dart';
import 'package:gerenciadordedespesas/services/conta_service.dart';

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ContaService cs = ContaService();
  late Future<List> _loadContas;
  List _contas = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadContas = _getContas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 175,
                child: FutureBuilder(
                  future: _loadContas,
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      _contas = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _contas.length,
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        itemBuilder: (context, index){
                          return cardConta(context, _contas[index]);
                        },
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              )
            ],
        )
    );
  }

  Future<List> _getContas() async {
    return await cs.getContaList();
  }


}
