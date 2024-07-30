import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/notes/notes_cubit.dart';
import '../../../model/note_model.dart';
import 'custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        // Reverse the notes list to display the last note first
        List<NoteModel> reversedNotes = List.from(notes.reversed);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: reversedNotes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomNoteItem(
                  note: reversedNotes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
