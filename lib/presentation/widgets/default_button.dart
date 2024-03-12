import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Function()? onPressed;
  Widget content;
  double height;
  double width;
  Color backGroundColor;

  DefaultButton(
      {required this.onPressed,
      required this.backGroundColor,
      required this.height,
      required this.width,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: content,
    );
  }
}
