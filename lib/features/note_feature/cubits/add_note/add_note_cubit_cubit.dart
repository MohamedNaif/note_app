import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/features/note_feature/model/note_model.dart';

import '../../../../constant.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());


  Color currentColor = kColors[0];

  addNotes(NoteModel note) async {
    note.color = currentColor.value;
    emit(AddNoteCubitLoading());

    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteCubitSuccess());
    } on Exception catch (e) {
      emit(AddNoteCubitError(error: e.toString()));
    }
  }
}
