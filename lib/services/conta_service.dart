import '../models/conta.dart';
import '../utils/db_util.dart';

class ContaService {

  List<Conta> _contaList = [];

  void addConta(Conta conta) {
    DbUtil.insertData('conta', conta.toMap());
  }

  Future<List> getContaList() async {
    final dataList = await DbUtil.getData('conta');
    _contaList = dataList.map((contaMap) => Conta.fromMap(contaMap)).toList();
    return _contaList;
  }


}