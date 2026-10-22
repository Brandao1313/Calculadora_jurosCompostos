# 💰 Simulador de Investimentos: Comparação de Rendimentos

Este projeto foi desenvolvido como parte da avaliação da disciplina de **Programação de Dispositivos Móveis (PDM)**. Trata-se de um aplicativo Flutter que permite simular e comparar dois investimentos distintos utilizando o regime de juros compostos.

## 🎯 Objetivo do Desafio
Criar um app capaz de receber dados de dois investimentos, calcular a evolução mês a mês e apresentar uma tela comparativa para o usuário, mostrando qual investimento traz o melhor retorno.

## ⚙️ Funcionalidades
- **Formulário de Entrada:** Campos para Capital Inicial, Aplicação Mensal e Taxa de Juros (%) para dois investimentos distintos, além de um período compartilhado em meses.
- **Validação de Dados:** O app impede que o usuário deixe campos vazios ou digite letras onde deveriam ser números.
- **Cálculo de Juros Compostos:** Lógica matemática que calcula o rendimento sobre o saldo acumulado e soma o aporte do mês.
- **Tela de Resultados (Comparação):**
  - Exibição do montante final e rendimento total.
  - Destaque visual (🏆) para o investimento vencedor.
  - Barra de proporção comparando os montantes finais.
  - Lista (tabela) detalhada mostrando a evolução do saldo mês a mês dos dois investimentos lado a lado.
- **Nova Simulação:** Botão para voltar à tela inicial e fazer novos cálculos.

## 🧮 Fórmula Utilizada
O cálculo é feito mês a mês, aplicando a taxa sobre o saldo anterior e somando o novo aporte:
> `Saldo_Mês = (Saldo_Anterior * (1 + Taxa_Mensal)) + Aporte_Mensal`

## 🗂️ Estrutura do Projeto
O código foi organizado seguindo boas práticas de separação de responsabilidades:
- `lib/models/`: Classes de dados (`Investment` e `MonthlyResult`).
- `lib/services/`: Lógica de cálculo dos juros compostos (`InvestmentCalculator`).
- `lib/screens/`: Telas do aplicativo (`InputScreen` e `ResultScreen`).
- `lib/widgets/`: Componentes reutilizáveis (ex: cartão do formulário).

## 🚀 Como executar o projeto
1. Certifique-se de ter o Flutter instalado e configurado em sua máquina.
2. Clone este repositório.
3. Abra o terminal na pasta do projeto e instale as dependências:
   ```bash
   flutter pub get
