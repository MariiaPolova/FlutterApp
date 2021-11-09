import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget { 
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
 }
class _MyAppState extends State<MyApp> {
  var questionI = 0;
  final questionsList = const [
    {
      'question': 'Color', 
      'answers': [ 'Red', 'Green', 'Blue' ]
    },
    {
      'question': 'Animal', 
      'answers': ['Dog', 'Cat' ]
    },
  ];

    void changeQuestion () {
      setState(() {
        questionI = questionI + 1;
      });
    }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app')),
        body: questionI < questionsList.length ? Column(
          children: <Widget>[
            Question((questionsList[questionI]['question'] as String)),
           ...(questionsList[questionI]['answers'] as List<String>).map((answer) { 
              return Answer(answer, changeQuestion);
              }
            ).toList()
          ],
        ) : Center(child: Text('You did it!'))
      ),
    );
  }
}