import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTextInput extends StatelessWidget {
  EditTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorMessage,
    this.maxLines = 1,
    this.fontSize = 20,
  });

  TextEditingController controller;
  int maxLines;
  String hintText;
  String errorMessage;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.displayMedium!.merge(
            TextStyle(
              fontSize: fontSize.sp,
              height: 1.4.h
            ),
          ),
      validator: (value) {
        if (value!.isNotEmpty) {
          return errorMessage;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}
