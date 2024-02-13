import 'package:flutter/material.dart';
import 'package:mini_projet/screens/result_screen.dart';
import 'package:mini_projet/widgets/answer_button.dart';
import 'package:mini_projet/data/questions.dart';

List<String> userAnswers = [];

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questionIndex,
  });

  final int questionIndex;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late int currentQuestionIndex;

  @override
  void initState() {
    currentQuestionIndex = widget.questionIndex;
    super.initState();
  }

  void _nextQuestion() {
    if (currentQuestionIndex == questions.length - 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ct) => ResultsScreen(chosenAnswers: userAnswers)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) =>
              QuestionsScreen(questionIndex: currentQuestionIndex + 1)));
    }
  }

  void _goBack() {
    if (currentQuestionIndex > 0) {
      // Remove the last answer when going back
      userAnswers.removeLast();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 187, 177),
        title: Text(
            'Question ${currentQuestionIndex + 1} out of ${questions.length}'),
        automaticallyImplyLeading: currentQuestionIndex == 0 ? false : true,
        leading: currentQuestionIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _goBack,
              )
            : null,
      ),
      backgroundColor: const Color.fromARGB(255, 187, 187, 177),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(
                  color: Color(0xFF0D1B2A),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map(
                (answer) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnswerButton(
                        answerText: answer,
                        onTap: () {
                          userAnswers.add(answer);
                          print(userAnswers);
                          _nextQuestion();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
