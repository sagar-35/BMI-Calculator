import 'package:bmi_calculator_starter/buttom_button.dart';
import 'package:bmi_calculator_starter/calculator_brain.dart';
import 'package:bmi_calculator_starter/constants.dart';
import 'package:bmi_calculator_starter/icon_widget.dart';
import 'package:bmi_calculator_starter/Screens/result_page.dart';
import 'package:bmi_calculator_starter/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusablecard_widget.dart';

enum Gender {male, female, none}


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

 //Color selectedColor = inactiveColor;
 Gender selectedGender = Gender.none;

 int height = 180;
 int weight = 65;
 int age = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReUsableCard(
                      onCardClick: (){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      color: selectedGender==Gender.male?
                      kActiveColor: kInactiveColor,
                        cardChild: const IconWidget(
                          icon: FontAwesomeIcons.mars,
                          color: Colors.white,
                          label: "Male",
                        ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      onCardClick: (){
                        setState(() {
                          selectedGender=Gender.female;
                        });
                      },
                      color: selectedGender==Gender.female?
                      kActiveColor: kInactiveColor,
                      cardChild: const IconWidget(
                        icon: FontAwesomeIcons.venus,
                        color: Colors.white,
                        label: "Female",
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(child: ReUsableCard(
            color: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text(
                "HEIGHT",
                style: kLableTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("$height",
                  style: kNumberTextStyle,),
                  const Text("cm",
                  style: kLableTextStyle,),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: const Color(0xFF646673),
                  thumbColor: const Color(0xFFEB1555),
                  overlayColor: const Color(0xFFEB1555).withOpacity(0.12),
                  thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                        },
                ),
              ),
                  ]
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReUsableCard(
                color: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "WEIGHT", style: kLableTextStyle ,
                    ),
                    Text(
                      "$weight",style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            }),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ReUsableCard(
                color: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "AGE", style: kLableTextStyle ,
                    ),
                    Text(
                      "$age",style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            }),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
              ),
    ]
    ),
    ),
              BottomButton(buttonTitle: "CALCULATE YOUR BMI",
                  onTap: (){
                CalculatorBrain brain = CalculatorBrain(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                    context)=>ResultPage(
                      bmiResult: brain.calculateBmi(),
                      resultText: brain.getResult(),
                      interpretation: brain.getInterpretation(),
                    ),
                  ),
                );

              })
    ],
    ),
    );

  }
}

