// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, unused_element, unused_local_variable, body_might_complete_normally_nullable

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_nativo/changeNotifier/changeNotifierController.dart';
import 'package:gerencia_de_estado_nativo/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPage();
}

class _ChangeNotifierPage extends State<ChangeNotifierPage> {
  final controller = ChangeNotifierController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('IMC Change Notifier'))),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return ImcGauge(imc: controller.imc);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pesoEC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Peso"),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                      locale: 'pt_br',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2),
                ],
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Peso Obrigatório';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: alturaEC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura"),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                      locale: 'pt_br',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2),
                ],
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Altura Obrigatório';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var formValid = formkey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt-br', decimalDigits: 2);

                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;

                      controller.calcularIMC(peso: peso, altura: altura);
                    }
                  },
                  child: Text('Calcular IMC'))
            ]),
          ),
        ),
      ),
    );
  }
}
