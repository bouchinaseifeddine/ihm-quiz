import 'package:flutter/material.dart';
import 'package:mini_projet/data/questions.dart';
import 'package:mini_projet/widgets/questions_summary/questions_summary.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

final formatter = DateFormat.yMd();

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  DateTime? _selectedDate;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': widget.chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year, now.month + 1, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });

    _showSnackBar(_selectedDate);
  }

  void _showSnackBar(DateTime? _selectedDate) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          _selectedDate == null
              ? 'Appointment has been removed '
              : 'Appointment has been set',
          style: const TextStyle(
            color: Color.fromARGB(255, 187, 187, 177),
          ),
        ),
        backgroundColor: const Color(0xFF0D1B2A),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 187, 177),
        title: const Text('Results'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromARGB(255, 187, 187, 177),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Color(0xFF0D1B2A),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 187, 187, 177),
                          backgroundColor: const Color(0xFF0D1B2A),
                        ),
                        icon: const Icon(Icons.date_range),
                        label: const Text('Set Appointment'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formatter.format(_selectedDate!),
                        style: const TextStyle(
                            color: Color(0xFF0D1B2A),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
