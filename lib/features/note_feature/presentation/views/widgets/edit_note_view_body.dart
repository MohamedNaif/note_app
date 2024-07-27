import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note_feature/model/note_model.dart';

import '../../../cubits/notes/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';
// import 'note_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.notes});
  final NoteModel notes;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onTap: () {
                widget.notes.title = title ?? widget.notes.title;
                widget.notes.content = content ?? widget.notes.content;
                widget.notes.save();
                BlocProvider.of<NotesCubit>(context).featchAllNotes();
                Navigator.pop(context);
              },
              title: 'تعديل الملاحظة',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.notes.title),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.notes.content,
                maxLines: 5),
          ],
        ),
      ),
    );
  }
}
