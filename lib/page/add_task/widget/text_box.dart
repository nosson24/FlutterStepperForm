import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  final Text headingText;
  final double heightSize;
  final Widget? isWidget;

  const TextBoxWidget({super.key, required this.headingText, required this.heightSize, this.isWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: headingText
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          width: MediaQuery.of(context).size.width,
          height: heightSize,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: isWidget,
          ),
        ),
      ],
    );
  }
}
