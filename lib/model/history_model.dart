import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final double income;
  final double remainingAmount;
  final DateTime date;

  HistoryModel({
    required this.income,
    required this.remainingAmount,
    required this.date,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      income: (map['income'] ?? 0).toDouble(),
      remainingAmount: (map['remainingAmount'] ?? 0).toDouble(),
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'income': income, 'remainingAmount': remainingAmount, 'date': date};
  }
}
