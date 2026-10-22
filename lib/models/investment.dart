/// Representa os dados de entrada de UM investimento.
class Investment {
  final String name;
  final double initialCapital;
  final double monthlyContribution;
  final double monthlyRate; // Em %, ex: 0.5 para 0,5% ao mês

  const Investment({
    required this.name,
    required this.initialCapital,
    required this.monthlyContribution,
    required this.monthlyRate,
  });
}