import 'package:flutter/material.dart';

class BlocDataManu extends StatelessWidget {
  final Text titleText;
  final Text subText;
  const BlocDataManu(
      {super.key, required this.titleText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: titleText,
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: subText,
              )),
          
        ],
      ),
    );
  }
}
