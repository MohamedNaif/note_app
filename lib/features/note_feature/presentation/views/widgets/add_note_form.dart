import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/add_note/add_note_cubit_cubit.dart';
import '../../../model/note_model.dart';
import 'custom_bttn.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title'),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
              onSaved: (value) {
                content = value;
              },
              hint: 'Content',
              maxLines: 5),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var noteModel = NoteModel(
                    title: title!,
                    content: content!,
                    date: DateTime.now().toString(),
                    color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNotes(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
