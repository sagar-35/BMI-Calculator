import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onCardClick;

  ReUsableCard({
    required this.color,
    this.cardChild,
    this.onCardClick,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: cardChild,
      ),
    );
  }
}