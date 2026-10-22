import '../models/investment.dart';
import '../models/monthly_result.dart';

class InvestmentCalculator {
  /// Simula o investimento por [months] meses.
  /// O rendimento é calculado sobre o saldo, e depois o aporte é somado.
  static SimulationResult simulate(Investment inv, int months) {
    final rate = inv.monthlyRate / 100; // Converte % para decimal (ex: 0.5 -> 0.005)
    final results = <MonthlyResult>[];
    
    double balance = inv.initialCapital;
    double invested = inv.initialCapital;

    for (int m = 1; m <= months; m++) {
      // 1. Aplica os juros sobre o saldo atual
      balance = balance * (1 + rate);
      
      // 2. Adiciona o aporte mensal
      balance += inv.monthlyContribution;
      
      // 3. Soma o valor aportado ao total investido
      invested += inv.monthlyContribution;

      // 4. Salva o resultado deste mês
      results.add(MonthlyResult(
        month: m,
        balance: balance,
        invested: invested,
        earnings: balance - invested,
      ));
    }

    // Retorna o pacote completo com o resultado final
    return SimulationResult(
      investment: inv,
      monthlyResults: results,
      finalBalance: balance,
      totalInvested: invested,
      totalEarnings: balance - invested,
    );
  }
}