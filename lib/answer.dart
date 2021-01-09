import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerQuestion;
  final String answer;
  Answer(this.answer, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answer),
        onPressed: answerQuestion,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
