import 'package:flutter/material.dart';
import 'splash_view.dart';

abstract class SplashViewViewModel extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Navigator.pushNamed(context, '/home');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
