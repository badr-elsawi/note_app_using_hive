import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/screens/edit_note_page/edite_note_input.dart';
import 'package:note_app/screens/view_note_page/view_note_page.dart';
import 'package:note_app/shared/components/elevated_button.dart';
import 'package:note_app/shared/components/square_icon_button.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({super.key});

  var title = TextEditingController(text: 'badrrr');
  var note = TextEditingController(
      text:
          'jdjkkd dkkfk bkdodon\njcjkdjvndjvi djdidi djdujs ssuus \n fjdjdjdi jdjdjdjd jdj djdjd djdj \n jfk');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
            backgroundColor: Color(0xff060E18),
            title: Text('Edit note'),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 20.w,
                  top: 5.h,
                  bottom: 5.h,
                ),
                child: SquareIconButton(
                  onPressed: () {},
                  icon: Icons.save,
                  forgroundColor: Colors.green,
                  size: 40.w,
                  borderWidth: 0.5,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  EditTextInput(
                    controller: title,
                    hintText: 'tittt',
                    errorMessage: '',
                    fontSize: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            for (int i = 1; i <= 10; i++)
                              LineWidget(
                                space: 35,
                              ),
                          ],
                        ),
                      ),
                      EditTextInput(
                        controller: note,
                        hintText: 'enter note',
                        errorMessage: '',
                        fontSize: 20,
                        maxLines: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: MyButton(
                      title: 'Save',
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
