


import 'package:flutter/material.dart';
import 'package:note_app/features/note_feature/presentation/views/widgets/color_item.dart';

class ColorList extends StatelessWidget {
  const ColorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ColorItem();
          }),
    );
  }
}
