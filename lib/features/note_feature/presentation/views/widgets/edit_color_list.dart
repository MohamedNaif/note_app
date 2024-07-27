import 'package:flutter/material.dart';
import 'package:note_app/features/note_feature/model/note_model.dart';

import '../../../../../constant.dart';
import 'color_item.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.notes});

  final NoteModel notes;

  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.notes.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.notes.color = kColors[index].value;

                  setState(() {});
                },
                child: ColorItem(
                  isSelected: currentIndex == index,
                  color: kColors[index],
                ),
              ),
            );
          }),
    );
  }
}
