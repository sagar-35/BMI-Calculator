import 'package:bmi_calculator_starter/buttom_button.dart';
import 'package:bmi_calculator_starter/constants.dart';
import 'package:bmi_calculator_starter/reusablecard_widget.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("BMI CALCULATOR"),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Expanded(child: Container(
           padding: const EdgeInsets.all(15.0),
          child: const Text(
          "Your Result",
            style: kTitleTextStyle,
              ) ,
             ),
    ),
          Expanded(
            flex: 5,
            child: ReUsableCard(
              color: kActiveColor,
              cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,
                    style: kResultTextStyle,),
                  Text(bmiResult,
                    style: kBMITextStyle,),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: "RE-CALCULATE YOUR BMI",
              onTap: (){
              Navigator.pop(context);
              })
             ],
              ),
    );
  }
}
