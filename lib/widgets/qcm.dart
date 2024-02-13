import 'package:flutter/material.dart';
import 'package:mini_projet/screens/start_screen.dart';

class Qcm extends StatelessWidget {
  const Qcm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 187, 187, 177),
          child: const StartScreen(),
        ),
      ),
    );
  }
}
