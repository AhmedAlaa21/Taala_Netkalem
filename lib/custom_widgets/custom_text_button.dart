import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String questionText;
  final String choiceText;
  final VoidCallback onTap;

  const CustomTextButton(
      {Key? key,
      required this.questionText,
      required this.choiceText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(primary: Colors.blue),
          child: Text(
            choiceText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
