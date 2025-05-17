import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_elevate/screens/home_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {HomeScreen.routName: (context) => HomeScreen()},
      initialRoute: HomeScreen.routName,
    );
  }
}
