import 'package:flutter/material.dart';
import 'package:to_do_list/core/shared/const.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, required this.datePicker, this.onPressed, required this.txt, });

  final DateTime datePicker;
  final void Function()? onPressed;
  final String txt;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: Row(
        children: [
          Text(
            'Date ',
            style: TextStyle(fontSize: 26,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w600,color: colorTheme),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
