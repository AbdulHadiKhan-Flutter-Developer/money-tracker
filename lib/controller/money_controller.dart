import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moneytracker/model/history_model.dart';

class MoneyController extends GetxController {
  final RxDouble target = 0.0.obs;
  final RxDouble income = 0.0.obs;
  final RxDouble remainingTarget = 0.0.obs;
  final RxList<HistoryModel> historyList = <HistoryModel>[].obs;

  @override
  void onInit() {
    fetchHistory();
    fetchMainData();
    super.onInit();
  }

  final String docId = 'global';

  Future<void> addtarget(double targetAmount) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('Target').doc(docId);
      await docRef.set({
        'target': targetAmount,
        'income': 0.0,
        'remainingAmount': targetAmount,
        'date': DateTime.now(),
      }, SetOptions(merge: true));

      target.value = targetAmount;
      income.value = 0.0;
      remainingTarget.value = targetAmount;
    } catch (e) {
      print('Error in addtarget: $e');
    }
  }

  Future<void> addincome(double incomeAmount) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('Target').doc(docId);
      final doc = await docRef.get();

      if (doc.exists) {
        final data = doc.data()!;
        final currentIncome = (data['income'] ?? 0).toDouble();
        final currentTarget = (data['target'] ?? 0).toDouble();

        final updatedIncome = currentIncome + incomeAmount;
        final updatedRemaining = currentTarget - updatedIncome;

        await docRef.update({
          'income': updatedIncome,
          'remainingAmount': updatedRemaining,
          'date': DateTime.now(),
        });

        await docRef.collection('history').add({
          'income': incomeAmount,
          'remainingAmount': updatedRemaining,
          'date': DateTime.now(),
        });

        income.value = updatedIncome;
        remainingTarget.value = updatedRemaining;
      }
    } catch (e) {
      print('Error in addincome: $e');
    }
  }

  Future<void> fetchHistory() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Target')
        .doc(docId)
        .collection('history')
        .orderBy('date', descending: true)
        .get();

    historyList.value = snapshot.docs
        .map((doc) => HistoryModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> fetchMainData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Target')
          .doc(docId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        target.value = (data['target'] ?? 0).toDouble();
        income.value = (data['income'] ?? 0).toDouble();
        remainingTarget.value = (data['remainingAmount'] ?? 0).toDouble();
      }
    } catch (e) {
      print('Error in fetchMainData: $e');
    }
  }
}
