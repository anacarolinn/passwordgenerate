import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:password_generate/app/app_colors.dart';
import 'package:password_generate/components/my_text.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeff6ff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 22),
              options(),
              SizedBox(height: 22),
              slider(),
              SizedBox(height: 22),
              generate(),
              SizedBox(height: 22),
              password.isEmpty ? SizedBox() : senha(),
            ],
          ),
        ),
      ),
    );
  }

  Column header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.shield500,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 6),
            MyText(
              text: 'Gerar Senha Segura',
              fontSize: 22,
            ),
          ],
        ),
        Center(
          child: MyText(
            text: 'Personalize sua senha com as opções abaixo',
            fontSize: 14,
            textColor: AppColors.subtitleColor,
          ),
        ),
      ],
    );
  }

  Container options() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFFe2e8f0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Opções da Senha',
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Letras maiúsculas (A-Z)',
                  textColor: AppColors.subtitleColor,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: upperLetters,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          upperLetters = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Letras minúsculas (a-z)',
                  textColor: AppColors.subtitleColor,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: lowerLetters,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          lowerLetters = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Números (0-9)',
                  textColor: AppColors.subtitleColor,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: numbers,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          numbers = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Símbolos (!@#\$...)',
                  textColor: AppColors.subtitleColor,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: symbols,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Color(0xFFcad5e2),
                    inactiveThumbColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          symbols = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container slider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFFe2e8f0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Quantidade de caracteres',
                  ),
                  MyText(
                    text: sliderValue.toStringAsFixed(0),
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    textColor: AppColors.secondaryColor,
                  )
                ],
              ),
            ),
            Slider(
              value: sliderValue,
              min: 6,
              max: 22,
              thumbColor: Colors.white,
              activeColor: AppColors.primaryColor,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: '6',
                    fontSize: 14,
                    textColor: AppColors.subtitleColor,
                  ),
                  MyText(
                    text: '22',
                    fontSize: 14,
                    textColor: AppColors.subtitleColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector generate() {
    return GestureDetector(
      onTap: onTapGenerate,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withAlpha(15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.refreshCcw,
                color: Colors.white,
              ),
              SizedBox(
                width: 6,
              ),
              MyText(
                text: 'Gerar Senha',
                textColor: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container senha() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFFe2e8f0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Sua Senha',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: password),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withAlpha(200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        LucideIcons.copy,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFe2e8f0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.subtitleColor.withAlpha(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    MyText(
                      text: password,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
