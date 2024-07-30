import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

import '../../../cubits/add_note/add_note_cubit_cubit.dart';
import '../../../model/note_model.dart';
import 'color_list.dart';
import 'custom_bttn.dart';
// import 'custom_row_icon.dart';
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
              hint: ('hintTitle').tr()),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
              onSaved: (value) {
                content = value;
              },
              hint: ('hintContent').tr(),
              maxLines: 5),
          const SizedBox(
            height: 20,
          ),
          // const CustomRowIcon(),
          const ColorList(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteCubitLoading ? true : false,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedDate =
                        DateFormat('yyyy-MM-dd').format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        content: content!,
                        date: formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNotes(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
