// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:moneytracker/utils/app_constant.dart';

class HistoryWidget extends StatelessWidget {
  final double income;
  final double remaining;
  final DateTime date;

  const HistoryWidget({
    super.key,
    required this.income,
    required this.remaining,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppConstant.primerycolor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(3, 0),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),

        height: 60,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(80, 255, 255, 255),
                    radius: 6,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 10,
                      color: AppConstant.background,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Income',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  SizedBox(width: 7),
                  Text(
                    '+ $income/-pkr',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: const Color.fromARGB(255, 0, 90, 3),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(80, 255, 255, 255),
                    radius: 6,
                    child: Icon(
                      Icons.money,
                      size: 10,
                      color: AppConstant.background,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Remaining',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  SizedBox(width: 7),
                  Text(
                    '$remaining/-pkr',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: const Color.fromARGB(255, 110, 0, 0),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    'Date: $date',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
