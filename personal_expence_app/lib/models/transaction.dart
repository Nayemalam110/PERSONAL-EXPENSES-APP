class Transaction {
  final String title;
  final String id;
  final DateTime date;
  final double amount;

  Transaction({
    required this.amount,
    required this.date,
    required this.id,
    required this.title,
  });
}
