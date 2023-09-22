import 'package:desafio_app_imc/model/imc.dart';

class ImcRepository {
  final List<Imc> _imcs = [];

  Future<void> adicionar(Imc imc) async {
    await Future.delayed(const Duration(milliseconds: 120));
    _imcs.add(imc);
  }

  Future<void> remover({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 120));
    _imcs.remove(_imcs.where((element) => element.id == id).first);
  }

  Future<List<Imc>> listarImcs() async {
    await Future.delayed(const Duration(milliseconds: 120));
    return _imcs;
  }
}
