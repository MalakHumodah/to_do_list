import 'package:flutter/material.dart';
import 'package:to_do_list/core/shared/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.txt,
      required this.controller,
       this.maxLines});

  final String txt;
  final TextEditingController controller;
  final int ? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: TextStyle(
                fontSize: 26,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: colorTheme),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter the $txt ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: txt,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
