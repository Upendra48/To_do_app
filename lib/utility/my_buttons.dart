
import 'package:flutter/material.dart ';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 10,
      onPressed: onPressed,
      color: const Color.fromARGB(255, 235, 236, 237),
      child: Text(text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      ),
      );
  }
}