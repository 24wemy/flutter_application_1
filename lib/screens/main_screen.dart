import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const Center(
        child: Text(
          "Welcome to the Main Screen!",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}