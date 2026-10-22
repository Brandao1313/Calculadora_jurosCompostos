import 'package:flutter/material.dart';
import '../models/investment.dart';
import '../services/investment_calculator.dart';
import 'result_screen.dart'; // Vamos criar essa tela no próximo passo

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Chave para validar o formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores dos textos (valores padrão para facilitar testes)
  final _cap1 = TextEditingController(text: '1000');
  final _ap1 = TextEditingController(text: '100');
  final _tx1 = TextEditingController(text: '0.5');

  final _cap2 = TextEditingController(text: '1000');
  final _ap2 = TextEditingController(text: '100');
  final _tx2 = TextEditingController(text: '0.8');

  final _meses = TextEditingController(text: '12');

  @override
  void dispose() {
    _cap1.dispose(); _ap1.dispose(); _tx1.dispose();
    _cap2.dispose(); _ap2.dispose(); _tx2.dispose();
    _meses.dispose();
    super.dispose();
  }

  // Converte texto para número (trocando vírgula por ponto)
  double _parseDouble(TextEditingController c) => double.parse(c.text.replaceAll(',', '.'));
  int _parseInt(TextEditingController c) => int.parse(c.text);

  void _comparar() {
    // Se algum campo estiver vazio ou errado, para aqui
    if (!_formKey.currentState!.validate()) return;

    // Cria os objetos de investimento
    final inv1 = Investment(
      name: 'Investimento 1',
      initialCapital: _parseDouble(_cap1),
      monthlyContribution: _parseDouble(_ap1),
      monthlyRate: _parseDouble(_tx1),
    );
    final inv2 = Investment(
      name: 'Investimento 2',
      initialCapital: _parseDouble(_cap2),
      monthlyContribution: _parseDouble(_ap2),
      monthlyRate: _parseDouble(_tx2),
    );

    // Roda o cálculo usando o arquivo que criamos em services
    final r1 = InvestmentCalculator.simulate(inv1, _parseInt(_meses));
    final r2 = InvestmentCalculator.simulate(inv2, _parseInt(_meses));

    // Navega para a próxima tela passando os resultados
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(result1: r1, result2: r2)),
    );
  }

  // Função auxiliar para criar os campos de texto bonitinhos
  Widget _campoTexto(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: ctrl,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (v) {
          if (v == null || v.isEmpty) return 'Obrigatório';
          if (double.tryParse(v.replaceAll(',', '.')) == null) return 'Inválido';
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulador de Investimentos')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // --- INVESTIMENTO 1 ---
            const Text('Investimento 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 8),
            _campoTexto(_cap1, 'Capital Inicial (R\$)'),
            _campoTexto(_ap1, 'Aplicação Mensal (R\$)'),
            _campoTexto(_tx1, 'Taxa Mensal (%)'),
            
            const Divider(height: 32),

            // --- INVESTIMENTO 2 ---
            const Text('Investimento 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 8),
            _campoTexto(_cap2, 'Capital Inicial (R\$)'),
            _campoTexto(_ap2, 'Aplicação Mensal (R\$)'),
            _campoTexto(_tx2, 'Taxa Mensal (%)'),

            const Divider(height: 32),

            // --- PERÍODO ---
            _campoTexto(_meses, 'Período (meses)'),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _comparar,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Text('COMPARAR INVESTIMENTOS', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}