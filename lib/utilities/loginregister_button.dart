import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton(
      {super.key,
      required this.text,
      this.buttonColor,
      required this.onPressed});

  final String text;
  final Color? buttonColor;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        elevation: 3.0,
        padding: EdgeInsets.all(14.0),
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
