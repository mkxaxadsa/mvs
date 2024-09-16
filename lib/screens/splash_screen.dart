import 'package:flutter/material.dart';
import 'package:mostbet_3/app/navigator/navigator.dart';
import 'package:mostbet_3/managers/hive_manager.dart';
import 'package:mostbet_3/screens/main_screen.dart';
import 'package:mostbet_3/screens/onboarding_1_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (LocalDBManager.isFirstTimeOpen) {
          AppNavigator.pushAndRemoveUntil(context,
              page: const Onboarding1Page());
        } else {
          AppNavigator.pushAndRemoveUntil(context, page: const MainPage());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
