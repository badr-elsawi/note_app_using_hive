import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/components/square_icon_button.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff060E18),
      elevation: 0,
      // collapsedHeight: 70.h,
      stretch: true,
      expandedHeight: 100.h,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
        title: Text(
          'my notes',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        titlePadding: EdgeInsetsDirectional.only(
          start: 20.w,
          top: 10.h,
          bottom: 10.h,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5.h,
          ).w,
          child: SquareIconButton(
            onPressed: (){},
            icon: Icons.search,
            forgroundColor: Colors.white,
            borderWidth: 0.5,
            size: 40.w,
          ),
        ),
      ],
    );
  }
}
