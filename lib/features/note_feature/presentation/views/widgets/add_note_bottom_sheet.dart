import 'package:flutter/material.dart';

import 'custom_bttn.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomTextField(hint: 'Title'),
            SizedBox(
              height: 18,
            ),
            CustomTextField(hint: 'Content', maxLines: 5),
            SizedBox(
              height: 40,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
