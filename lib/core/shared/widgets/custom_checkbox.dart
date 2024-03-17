import 'package:flutter/material.dart';

import '../const.dart';

class CustomCheckbox extends StatelessWidget {
   const CustomCheckbox({
    super.key,
    required this.checkBoxValue,
    required this.pad,
    this.onChanged,
    required this.fontSize,
  });

  final double pad;
  final bool checkBoxValue;
  final void Function(bool?)? onChanged;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: Row(
        children: [
          Text(
            'Visible ',
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w600,
                color: colorTheme),
          ),
          SizedBox(
            width: 16,
          ),
          Checkbox(
            checkColor: Colors.white,
            value: checkBoxValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
