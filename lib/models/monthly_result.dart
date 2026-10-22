
import 'investment.dart';
/// Representa o resultado do investimento em um mês específico.
class MonthlyResult {
  final int month;
  final double balance;   // Saldo total no mês
  final double invested;  // Quanto foi investido até o mês
  final double earnings;  // Rendimento acumulado até o mês

  const MonthlyResult({
    required this.month,
    required this.balance,
    required this.invested,
    required this.earnings,
  });
}

/// Representa o resultado final de um investimento após a simulação.
class SimulationResult {
  final Investment investment;
  final List<MonthlyResult> monthlyResults;
  final double finalBalance;
  final double totalInvested;
  final double totalEarnings;

  const SimulationResult({
    required this.investment,
    required this.monthlyResults,
    required this.finalBalance,
    required this.totalInvested,
    required this.totalEarnings,
  });
}