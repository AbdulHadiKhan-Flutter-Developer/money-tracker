// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneytracker/controller/money_controller.dart';
import 'package:moneytracker/utils/app_constant.dart';
import 'package:moneytracker/widget/history_widget.dart';

class MoneyTrackingScreen extends StatefulWidget {
  const MoneyTrackingScreen({super.key});

  @override
  State<MoneyTrackingScreen> createState() => _MoneyTrackingScreenState();
}

class _MoneyTrackingScreenState extends State<MoneyTrackingScreen> {
  TextEditingController targetcontroller = TextEditingController();
  TextEditingController incomecontroller = TextEditingController();

  final MoneyController moneyController = Get.put(MoneyController());

  @override
  void initState() {
    moneyController.fetchMainData();
    moneyController.fetchHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final history = moneyController.historyList;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moneytrackingscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 180,
                width: 600,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(3, 0),
                      spreadRadius: 2,
                      blurRadius: 6,
                    ),
                  ],
                  color: AppConstant.primerycolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Remaining Balance',
                            style: TextStyle(
                              fontFamily: AppConstant.family,
                              color: AppConstant.background,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.expand_less,
                            color: AppConstant.background,
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz, color: AppConstant.background),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Obx(
                        () => Text(
                          'PKR ${moneyController.remainingTarget.value}/-',
                          style: TextStyle(
                            fontFamily: AppConstant.family,
                            color: AppConstant.background,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: 17,
                            color: AppConstant.background,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Income',
                            style: TextStyle(
                              fontFamily: AppConstant.family,
                              color: AppConstant.background,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.money,
                            size: 17,
                            color: AppConstant.background,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Target',
                            style: TextStyle(
                              fontFamily: AppConstant.family,
                              color: AppConstant.background,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              'PKR ${moneyController.income.value}/-',
                              style: TextStyle(
                                fontFamily: AppConstant.family,
                                color: AppConstant.background,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Obx(
                            () => Text(
                              'PKR ${moneyController.target.value}/-',
                              style: TextStyle(
                                fontFamily: AppConstant.family,
                                color: AppConstant.background,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Income & Expense History',
              style: TextStyle(
                fontFamily: AppConstant.family,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return HistoryWidget(
                      income: item.income,
                      remaining: item.remainingAmount,
                      date: item.date,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstant.primerycolor,
        child: Icon(Icons.add, color: AppConstant.background),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppConstant.primerycolor,
              title: Center(
                child: Text(
                  'Please Select',
                  style: TextStyle(
                    fontFamily: AppConstant.family,
                    color: AppConstant.background,
                    fontSize: 16,
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    addTargetBottomSheet(context);
                  },
                  child: Text(
                    'Add Target',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.primerycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    addIncomeBottomSheet(context);
                  },
                  child: Text(
                    'Add Income',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.primerycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void addTargetBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppConstant.primerycolor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Target',
                  style: TextStyle(
                    fontFamily: AppConstant.family,
                    color: AppConstant.background,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: targetcontroller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Enter Target Amount',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    double target =
                        double.tryParse(targetcontroller.text) ?? 0.0;
                    await moneyController.addtarget(target);
                    moneyController.fetchMainData();
                    moneyController.fetchHistory();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Set Target',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.primerycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addIncomeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppConstant.primerycolor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Income',
                  style: TextStyle(
                    fontFamily: AppConstant.family,
                    color: AppConstant.background,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: incomecontroller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Enter Income Amount',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    double income =
                        double.tryParse(incomecontroller.text) ?? 0.0;
                    await moneyController.addincome(income);
                    moneyController.fetchMainData();
                    moneyController.fetchHistory();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Income',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.primerycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
