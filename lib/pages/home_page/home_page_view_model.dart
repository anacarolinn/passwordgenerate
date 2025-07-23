import 'dart:math';

import 'package:flutter/material.dart';
import './home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  double sliderValue = 8;
  bool upperLetters = true;
  bool lowerLetters = true;
  bool numbers = true;
  bool symbols = false;
  String password = '';

  @override
  void initState() {
    super.initState();
    sliderValue;
    upperLetters;
    lowerLetters;
    numbers;
    symbols;
  }

  @override
  void dispose() {
    super.dispose();
  }

  onTapGenerate() {
    setState(() {
      password = generatePassword(
        lenght: sliderValue,
        incluedUpperLetters: upperLetters,
        incluedLowerLetters: lowerLetters,
        incluedNumbers: numbers,
        incluedSymbols: symbols,
      );
    });
  }

  String generatePassword({
    required double lenght,
    required bool incluedUpperLetters,
    required bool incluedLowerLetters,
    required bool incluedNumbers,
    required bool incluedSymbols,
  }) {
    const lettersUpper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lettersLower = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*-_=+[]{}|;:\'",.?/<>~`';

    String caracteres = '';

    if (incluedUpperLetters) caracteres += lettersUpper;
    if (incluedLowerLetters) caracteres += lettersLower;
    if (incluedNumbers) caracteres += numbers;
    if (incluedSymbols) caracteres += symbols;

    final random = Random.secure();

    return List.generate(lenght.toInt(), (_) {
      final index = random.nextInt(caracteres.length);
      return caracteres[index];
    }).join();
  }
}
