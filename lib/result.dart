// Packages
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restartQuiz;

  Result({@required this.totalScore, @required this.restartQuiz});

  String get resultPhrase {
    String resultText = "You did it!";
    if (totalScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (totalScore <= 12) {
      resultText = "Pretty likeable!";
    } else if (totalScore <= 16) {
      resultText = "You are ...strange?!";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(4),
              child: Text(
                resultPhrase,
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              child: RaisedButton(
                child: Text("Restart Quiz!!"),
                onPressed: restartQuiz,
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
