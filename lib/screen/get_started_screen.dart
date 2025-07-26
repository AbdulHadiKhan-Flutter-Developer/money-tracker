// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:moneytracker/screen/money_tracking_screen.dart';
import 'package:moneytracker/utils/app_constant.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/getstartedscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Lottie.asset(
                'assets/animations/moneyanimation.json',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 130),
            Center(
              child: Text(
                ' Save Smarter \n   Save More',
                style: TextStyle(
                  fontFamily: AppConstant.family,
                  color: AppConstant.primerycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Get.offAll(MoneyTrackingScreen());
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppConstant.primerycolor,
                  boxShadow: [
                    BoxShadow(
                      color: AppConstant.primerycolor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: AppConstant.family,
                      color: AppConstant.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
