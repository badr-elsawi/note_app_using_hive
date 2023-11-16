import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/components/elevated_button.dart';

import '../shared/components/text_input.dart';
import '../shared/styles/style_constants.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(StyleConstants.borderRadius).w,
          topEnd: const Radius.circular(StyleConstants.borderRadius).w,
        ),
        color: Color(0xff1A212A).withOpacity(0.7),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: StyleConstants.defaultHPadding.w,
          end: StyleConstants.defaultHPadding.w,
          top: 15.h,
          bottom: MediaQuery.of(context).viewInsets.bottom > 5
              ? MediaQuery.of(context).viewInsets.bottom
              : 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add a new note',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Title',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.h),
              TextInput(
                hintText: 'enter note title',
                errorMessage: 'this is bad',
              ),
              SizedBox(height: 10.h),
              Text(
                'Note',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.h),
              TextInput(
                hintText: 'enter the note',
                errorMessage: 'this is bad',
                maxLines: 7,
              ),
              SizedBox(height: 15.h),
              Center(
                child: MyButton(
                  title: 'Save',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget blury({
  required Widget child,
  double sigmaX = 10,
  double sigmaY = 10,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
    child: child,
  );
}
