import 'package:flutter/material.dart';
import 'package:mini_projet/widgets/information.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 187, 177),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 187, 177),
        title: const Text(
          'Enter your informations',
          style: TextStyle(
            color: Color(0xFF0D1B2A),
            fontSize: 24,
          ),
        ),
      ),
      body: const Information(),
    );
  }
}
