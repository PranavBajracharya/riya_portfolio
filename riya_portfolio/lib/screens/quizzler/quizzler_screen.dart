// import 'dart:js_interop';

import 'package:flutter/material.dart';
// import 'question.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizzlerScreen extends StatefulWidget {
  const QuizzlerScreen({super.key});

  @override
  State<QuizzlerScreen> createState() => _QuizzlerScreenState();
}

class _QuizzlerScreenState extends State<QuizzlerScreen> {
  List<Widget> scoreKeeper = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quater of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  // Question q1 = Question(q:'You can lead a cow down stairs but not up stairs.', a:false);

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(
      () {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 150.0,
              ),
              child: Text(
                // 'This is where the question text will go.',
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100.0,
                horizontal: 50.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))))),
                child: const Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100.0,
                horizontal: 50.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(false);
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))))),
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
