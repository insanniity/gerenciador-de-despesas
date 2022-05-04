import 'package:flutter/material.dart';
import 'package:gerenciadordedespesas/screens/home/home_screen.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}
