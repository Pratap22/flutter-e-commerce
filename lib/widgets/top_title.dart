import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subTitle;
  bool? showBackButton;
  TopTitle(
      {super.key,
      required this.title,
      required this.subTitle,
      this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 12,
        ),
        if (showBackButton ?? false)
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              height: 12,
            )
          ]),
        Text(
          title,
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
