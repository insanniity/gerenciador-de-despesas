import 'package:gerenciadordedespesas/models/transacao.dart';

import '../utils/db_util.dart';

class TransacaoService {

  List<Transacao> _transacoesList = [];


  void addTransacao(Transacao transacao) {
    DbUtil.insertData('transacao', transacao.toMap());
  }

  Future<List> getTransacoesList() async {
    final dataList = await DbUtil.getData('transacao');
    _transacoesList = dataList.map((trMap) => Transacao.fromMap(trMap)).toList();
    return _transacoesList;
  }

}