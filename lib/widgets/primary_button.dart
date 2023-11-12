import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(onPressed: onPressed, child: Text(text)));
  }
}
