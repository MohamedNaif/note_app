import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/notes/notes_cubit.dart';
import '../../../model/note_model.dart';
import 'custom_note_item.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>? notes = BlocProvider.of<NotesCubit>(context).notes;

        // Check if notes is null or empty
        if (notes == null || notes.isEmpty) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/still-empty-blank-paper-in-clipboard-no-note-record-or-data-yet-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg'))),
              ),
              Center(
                child: Text(
                  ("no_notes_added").tr(),
                  
                  style: const TextStyle(fontSize: 28, color: Colors.grey),
                ),
              ),
            ],
            
          );
          
        }

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
