// Packages
import 'package:flutter/material.dart';

// Our own components
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Question(questions[questionIndex]['text']),
        ),
        ...(questions[questionIndex]['options'] as List<Map<String, Object>>)
            .map((o) {
          return ListTile(
            title: Answer(o['value'], () => answerQuestion(o['score'])),
          );
        }).toList(),
      ],
    );
  }
}
