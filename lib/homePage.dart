// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_nativo/blocPattern-strams/blocPattern.dart';
import 'package:gerencia_de_estado_nativo/changeNotifier/changeNotifier.dart';
import 'package:gerencia_de_estado_nativo/setState/setstatePage.dart';
import 'package:gerencia_de_estado_nativo/valueNotifier/valueNotifier.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page, 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Gerênciamento de estado NATIVO')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: mediaQuery.size.width * .80,
              height: mediaQuery.size.height * .1,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, SetStatePage()),
                child: const Text(
                  'SetState',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.size.width * .80,
              height: mediaQuery.size.height * .1,
              child:  ElevatedButton(
                onPressed: () => _goToPage(context, ValueNotifierPage()),
                child: Text(
                  'ValueNotifier',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.size.width * .80,
              height: mediaQuery.size.height * .1,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, ChangeNotifierPage()),
                child: Text(
                  'changeNotifier',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.size.width * .80,
              height: mediaQuery.size.height * .1,
              child: ElevatedButton(
                onPressed: () => _goToPage(context, BlocPatternPage()),
                child: Text(
                  'Bloc Pattern\n   (Strams)',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}