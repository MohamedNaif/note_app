import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../cubits/add_note/add_note_cubit_cubit.dart';
import '../../../cubits/notes/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitError) {
            if (kDebugMode) {
              print("Failure: ${state.error}");
            }
          }

          if (state is AddNoteCubitSuccess) {
             BlocProvider.of<NotesCubit>(context).featchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
