import 'package:flutter/material.dart';
import 'package:password_generate/components/my_text.dart';
import './home_page_view_model.dart';

/// View - Responsável apenas pela apresentação (UI)
/// Herda do ViewModel para acessar estado e lógica de negócio
class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Senhas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Opções da senha',
            ),
            SizedBox(height: 22),
            options(),
            SizedBox(height: 22),
            MyText(text: 'Senha Gerada'),
            SizedBox(height: 10),
            Container(
              width: 500,
              height: 50,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    MyText(text: password),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onTapGenerate,
              child: Container(
                color: Colors.red,
                child: MyText(text: 'Gerar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column options() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: 'Tamanho:',
            ),
            MyText(text: sliderValue.toStringAsFixed(0))
          ],
        ),
        Slider(
          value: sliderValue,
          min: 6,
          max: 22,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'Letras Maiusculas(A-Z)'),
            Checkbox(
              checkColor: Colors.white,
              value: upperLetters,
              onChanged: (bool? value) {
                setState(
                  () {
                    upperLetters = value!;
                  },
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'Letras Minisculas(a-z)'),
            Checkbox(
              checkColor: Colors.white,
              value: lowerLetters,
              onChanged: (bool? value) {
                setState(
                  () {
                    lowerLetters = value!;
                  },
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'Numeros(0-9)'),
            Checkbox(
              checkColor: Colors.white,
              value: numbers,
              onChanged: (bool? value) {
                setState(
                  () {
                    numbers = value!;
                  },
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'Símbolos(!@#\$%^&*)'),
            Checkbox(
              checkColor: Colors.white,
              value: symbols,
              onChanged: (bool? value) {
                setState(
                  () {
                    symbols = value!;
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
