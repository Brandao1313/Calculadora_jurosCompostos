import 'package:flutter/material.dart';
import '../models/monthly_result.dart';

class ResultScreen extends StatelessWidget {
  final SimulationResult result1;
  final SimulationResult result2;

  const ResultScreen({super.key, required this.result1, required this.result2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Center(
        child: Text(
          'Funcionou!\nInv1 Final: R\$ ${result1.finalBalance.toStringAsFixed(2)}\nInv2 Final: R\$ ${result2.finalBalance.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}