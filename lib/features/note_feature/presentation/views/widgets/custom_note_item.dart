import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/notes/notes_cubit.dart';
import '../../../model/note_model.dart';
import 'edit_note_view_body.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to edit note view
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteViewBody(
            notes: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                note.content,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).featchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 32,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                (note.date).tr(),
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
