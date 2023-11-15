import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note-Cubit/Notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context) => BlocProvider.of(context);

  bool bottomSheet = false;

  void changeSheetState() {
    bottomSheet = !bottomSheet;
    emit(ChangeSheetState());
  }
}
