import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityCounter extends StatelessWidget {
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const QuantityCounter(
      {super.key,
      required this.quantity,
      required this.onMinus,
      required this.onPlus});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onMinus,
            child: const Icon(Icons.remove_circle)),
        const SizedBox(
          width: 12,
        ),
        Text(quantity.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 12,
        ),
        CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onPlus,
            child: const Icon(Icons.add_circle))
      ],
    );
  }
}
