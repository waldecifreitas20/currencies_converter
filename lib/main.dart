import 'package:conversor_moedas/homepage.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const AppStart());
}

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        canvasColor: Colors.grey[800],
      ),
    );
  }
}
