import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';
// import 'note_list_view.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'تعديل الملاحظة',
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(hint: 'Title'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(hint: 'Content', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
