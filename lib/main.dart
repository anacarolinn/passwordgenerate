import 'package:flutter/material.dart';
import 'package:password_generate/pages/home_page/home_page.dart';
import 'package:password_generate/pages/splash_page/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashView(),
        '/home': (BuildContext context) => HomePage(),
      },
      initialRoute: '/',
    );
  }
}
