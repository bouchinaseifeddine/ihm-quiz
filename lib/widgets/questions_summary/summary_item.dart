import 'package:flutter/material.dart';

import 'package:mini_projet/widgets/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(
                    color: Color(0xFF0D1B2A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 18, 59, 105),
                    )),
                Text(itemData['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 11, 85, 42),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
