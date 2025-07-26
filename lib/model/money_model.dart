import 'package:cloud_firestore/cloud_firestore.dart';

class MoneyModel {
  final String id;
  final double target;
  final double income;
  final double remainingAmount;
  final DateTime date;

  MoneyModel({
    required this.id,
    required this.target,
    required this.income,
    required this.remainingAmount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'target': target,
      'income': income,
      'remainingAmount': remainingAmount,
      'date': date,
    };
  }

  factory MoneyModel.fromMap(Map<String, dynamic> map) {
    return MoneyModel(
      id: map['id'] ?? '',
      target: (map['target'] ?? 0).toDouble(),
      income: (map['income'] ?? 0).toDouble(),
      remainingAmount: (map['remainingAmount'] ?? 0).toDouble(),
      date: (map['date'] as Timestamp).toDate(), // ✅ Fix here
    );
  }
}
