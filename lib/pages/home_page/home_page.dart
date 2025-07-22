import 'package:flutter/material.dart';
import './home_page_view.dart';

/// Widget principal que implementa o padrão MVVM
/// Separa a lógica de apresentação (View) da lógica de negócio (ViewModel)
class HomePage extends StatefulWidget {
  static const route = '/home_page/';

  const HomePage({super.key});

  @override
  HomePageView createState() => HomePageView();
}

