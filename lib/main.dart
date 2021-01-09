// Packages
import 'package:flutter/material.dart';

// Our own components
import './quiz.dart';
import './result.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _questions = [
    {
      "text": "What\'s your favorite color ?",
      "options": [
        {"value": "Black", "score": 10},
        {"value": "Green", "score": 5},
        {"value": "Red", "score": 3},
        {"value": "White", "score": 1},
      ],
    },
    {
      "text": "What\'s your favorite animal ?",
      "options": [
        {"value": "Rabbit", "score": 3},
        {"value": "Snake", "score": 11},
        {"value": "Elephant", "score": 5},
        {"value": "Lion", "score": 9},
      ]
    },
    {
      "text": "Who\'s your favorite instructor ?",
      "options": [
        {"value": "John", "score": 1},
        {"value": "Jack", "score": 1},
        {"value": "Joss", "score": 1},
        {"value": "Jill", "score": 1},
      ],
    }
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      _totalScore = _totalScore + score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void _restartQuiz() {
    _totalScore = 0;
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Questions and Answers"))),
        body: _questionIndex + 1 <= _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                totalScore: _totalScore,
                restartQuiz: _restartQuiz,
              ),
      ),
    );
  }
}
