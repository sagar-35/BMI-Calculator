import 'package:bmi_calculator_starter/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(top: 20.0),
        color: kButtonContainerColor,
        width: double.infinity,
        height: kButtonContainerHeight,
        child: Center(
          child:Text(
            buttonTitle,
            style: kButtonTextStyle,

          ),
        ),

      ),
    );
  }
}
