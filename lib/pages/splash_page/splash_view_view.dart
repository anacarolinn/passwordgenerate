import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:password_generate/app/app_colors.dart';
import 'package:password_generate/components/my_text.dart';
import 'splash_view_view_model.dart';

class SplashViewView extends SplashViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: <Color>[
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
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
                  child: Icon(
                    LucideIcons.shield,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              MyText(
                text: 'Gerador de senhas',
                textColor: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10),
              MyText(
                text:
                    'Crie senhas seguras e personalizadas \npara proteger suas contas.',
                textColor: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
