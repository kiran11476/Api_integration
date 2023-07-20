import 'package:flutter/material.dart';

class BtnFrave extends StatelessWidget {
  final String text;

  final double height;
  final double width;
  final double borderRadius;

  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback? onPressed;

  const BtnFrave(
      {super.key,
      required this.text,
      this.height = 50,
      this.width = double.infinity,
      this.borderRadius = 8.0,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 18,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
