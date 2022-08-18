// ignore_for_file: file_names, unused_import, unused_field, unused_local_variable

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gerencia_de_estado_nativo/blocPattern-strams/IMCstate.dart';

class BlocPatternController {
  final _streamController = StreamController<IMCstate>()..add(IMCstate(imc: 0));

  Stream<IMCstate> get imcOut => _streamController.stream;

  Future<void> calcularIMC(
      {required double peso, required double altura}) async {
    _streamController.add(IMCstate(imc: 0));
    await Future.delayed(const Duration(seconds: 1));
    final imc = peso / pow(altura, 2);
    _streamController.add(IMCstate(imc: imc));
  }

  void dispose() {
    _streamController.close();
  }
}
