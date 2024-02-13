import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projet/screens/information_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void _nextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const InformationScreen()),
    );
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/qcm.png',
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          const Text(
            textAlign: TextAlign.center,
            'Human Machine Interface Exam',
            style: TextStyle(
              color: Color(0xFF0D1B2A),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {
              _nextPage(context);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(140, 45),
              backgroundColor: const Color(0xFF0D1B2A),
              side: const BorderSide(
                  color: Color(0xFF0D1B2A), width: 2.5), //<-- SEE HERE
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 187, 187, 177),
            ),
            label: const Text(
              'Continue',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 187, 187, 177),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton.icon(
            onPressed: () {
              SystemNavigator.pop();
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(140, 45),
              foregroundColor: const Color(0xFF0D1B2A),
              side: const BorderSide(
                  color: Color(0xFF0D1B2A), width: 2.5), //<-- SEE HERE
            ),
            icon: const Icon(Icons.exit_to_app_rounded),
            label: const Text(
              'Leave',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Made by Seifeddine Bouchina',
            style: TextStyle(
              color: Color(0xFF0D1B2A),
            ),
          ),
        ],
      ),
    );
  }
}
