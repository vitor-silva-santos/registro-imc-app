import 'package:desafio_app_imc/shared/colors_imc.dart';
import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  late double _altura;
  late double _peso;

  Imc({required double altura, required double peso}) {
    _altura = altura / 100;
    _peso = peso;
  }
  String get id => _id;
  double get altura => _altura;
  double get peso => _peso;

  double calcularIMC() {
    return (_peso / (_altura * _altura)).truncateToDouble();
  }

  Color? corImc(double imc) {
    if (imc < 18.5) {
      return coresImc[0][1];
    } else if (imc >= 18.5 && imc < 25) {
      return coresImc[1][2];
    } else if (imc >= 25 && imc < 30) {
      return coresImc[2][3];
    } else if (imc >= 30 && imc < 35) {
      return coresImc[3][4];
    } else if (imc >= 35 && imc < 40) {
      return coresImc[4][5];
    } else {
      return coresImc[5][6];
    }
  }
}
