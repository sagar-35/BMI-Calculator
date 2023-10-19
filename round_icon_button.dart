import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton({super.key, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      shape:  const CircleBorder(),
      fillColor: const Color(0xFF646673),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
    ),
    );
  }
}
