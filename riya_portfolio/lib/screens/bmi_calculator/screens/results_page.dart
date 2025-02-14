import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';


class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                color: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Normal',
                      style: kresultTextStyle,
                    ),
                    Text(
                      '18.3',
                      style: kBMITextstyle,
                    ),
                    Text(
                      'Your BMI result is quit low, you should eat more.',
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                )),
          ),

    BottomButton(onTap: () {
      Navigator.pop(context);
    }, buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
