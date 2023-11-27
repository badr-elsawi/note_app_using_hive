import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/cash_helper/cash_helper.dart';
import 'package:note_app/shared/constants.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context) => BlocProvider.of(context);

  void addNote({
    required String title,
    required String note,
  }) {
    emit(AddNoteLoadingState());
    String formatedDate = DateFormat.yMd().format(DateTime.now()).toString();
    CashServices.add(
      value: NoteModel(
        title: title,
        note: note,
        date: formatedDate,
        isPinned: false,
        inTrash: false,
      ),
      boxName: noteBox,
    ).then((value) {
      emit(AddNoteSuccessState());
    }).catchError((error) {
      emit(AddNoteErrorState(error.toString()));
    });
  }

  List<NoteModel> notes = [];

  void getNotes() {
    try {
      notes = CashServices.get<NoteModel>(boxName: noteBox);
      emit(GetNotesSuccessState());
    } catch (error) {
      emit(GetNotesErrorState(error.toString()));
    }
  }

  void deleteNote(NoteModel note) {
    note.delete();
    getNotes();
  }

  void editNote({
    required NoteModel model,
    required String title,
    required String note,
  }) {
    model.title = title;
    model.note = note;
    model.save();
    getNotes();
  }
}
