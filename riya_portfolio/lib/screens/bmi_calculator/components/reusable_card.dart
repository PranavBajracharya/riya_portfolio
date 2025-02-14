import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({super.key});

  ReusableCard({
    required this.color,
    required this.cardChild,
    this.onTap,
  });

  final Color color;
  final Widget cardChild;
  final Function()? onTap;
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPress(),
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
