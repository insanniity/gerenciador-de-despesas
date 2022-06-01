import 'package:gerenciadordedespesas/models/transacao.dart';
import 'package:gerenciadordedespesas/services/conta_service.dart';

import '../utils/db_util.dart';

class TransacaoService {

  List<Transacao> _transacoesList = [];
  ContaService cs = ContaService();

  void addTransacao(Transacao transacao) {
    DbUtil.insertData('transacao', transacao.toMap());
    cs.editSaldoConta(transacao.conta, transacao.valor, transacao.tipo);
  }

  Future<List> getTransacoesList() async {
    final dataList = await DbUtil.getData('transacao');
    _transacoesList = dataList.map((trMap) => Transacao.fromMap(trMap)).toList();
    return _transacoesList;
  }

  Future<List> getTransacoesConta(int? id) async {
    String whereString = "conta=?";
    List<dynamic> whereArguments = [id];
    final dataList = await DbUtil.getDataWhere('transacao', whereString, whereArguments);
    return dataList.map((transacao) => Transacao.fromMap(transacao)).toList();
  }

}