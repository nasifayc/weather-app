import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.value,
      required this.color,
      required this.isBold,
      this.fontSize});
  final String value;
  final Color color;
  final bool isBold;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize ?? 16,
      ),
    );
  }
}
