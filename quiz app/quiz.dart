import 'package:flutter/material.dart';
import 'questions.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key,required this.questions, required this.questionIndex, required this.answerQuestion}) : super(key: key);

  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(), questionText: '',
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>).map((answer) {
          return Answer(
                  () => answerQuestion(answer['score']), answer['text'].toString(), answerText: '', selectHandler: () {  },);
        }).toList()
      ],
    );
  }
}
