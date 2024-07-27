import 'package:flutter/material.dart';

class QuizzlerScreen extends StatefulWidget {
  const QuizzlerScreen({super.key});

  @override
  State<QuizzlerScreen> createState() => _QuizzlerScreenState();
}

class _QuizzlerScreenState extends State<QuizzlerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 150.0),
              child: Text(
                'This is where the question text will go.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
