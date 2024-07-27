import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../constant.dart';
import '../../model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  featchAllNotes(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      List<NoteModel> notes = noteBox.values.toList();
      emit(NotesSuccess(notes));
    } on Exception catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
