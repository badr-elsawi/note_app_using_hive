import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/screens/view_note_page/view_note_page.dart';
import 'package:note_app/shared/styles/style_constants.dart';
import 'package:page_transition/page_transition.dart';

import '../shared/components/square_icon_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20).w,
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ViewNotePage(),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: StyleConstants.defaultHPadding.w,
          end: StyleConstants.defaultHPadding.w,
          top: 10.h,
          bottom: 15.h,
        ),
        height: 170.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StyleConstants.borderRadius).w,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xff109242).withOpacity(0.8),
              Color(0xff6BBA50).withOpacity(0.8),
              // Colors.transparent,
              // Colors.teal.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'flutter demons',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 5.w),
                SquareIconButton(
                  onPressed: () {},
                  icon: Icons.push_pin_rounded,
                  forgroundColor: Colors.lightGreen,
                  size: 40.w,
                  borderWidth: 0,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                SizedBox(width: 15.w),
                SquareIconButton(
                  onPressed: () {},
                  icon: Icons.delete_rounded,
                  forgroundColor: Colors.deepOrangeAccent,
                  size: 40.w,
                  borderWidth: 0,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'this is a demo note for testing the UI of the note item in order to make it the best it could be',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'Mars 16',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
