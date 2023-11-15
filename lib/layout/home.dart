import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/layout/bottom_sheet.dart';
import 'package:note_app/layout/my_app_bar.dart';
import 'package:note_app/layout/note_item.dart';
import '../shared/styles/style_constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              MyAppBar(),
              SliverToBoxAdapter(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NoteItem(),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: 3,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              cubit.bottomSheet ? Icons.arrow_downward_rounded : Icons.edit,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(StyleConstants.borderRadius).w,
                    topEnd: Radius.circular(StyleConstants.borderRadius).w,
                  ),
                ),
                builder: (context) => blury(child: Sheet()),
              );
            },
          ),
        );
      },
    );
  }
}
