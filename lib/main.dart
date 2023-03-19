import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      ++_questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favourite color',
        'answerText': ['black', 'blue', 'red', 'green']
      },
      {
        'questionText': 'What is your favourite animal',
        'answerText': ['lion', 'wolf', 'hyena', 'deer']
      },
      {
        'questionText': 'What is your favourite fruit',
        'answerText': ['mango', 'kiwi', 'grapes', 'apple']
      },
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first App'),
      ),
      body: Column(
        children: [
          Questions(
            questions[_questionIndex]['questionText'].toString(),
          ),
          ...(questions[_questionIndex]['answerText'] as List<String>)
              .map((answers) {
            return Answer(answerQuestion, answers);
          })
        ],
      ),
    ));
  }
}
