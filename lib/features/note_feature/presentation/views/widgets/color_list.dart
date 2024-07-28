// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note_feature/presentation/views/widgets/color_item.dart';

import '../../../../../constant.dart';
import '../../../cubits/add_note/add_note_cubit_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
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
                  BlocProvider.of<AddNoteCubit>(context).currentColor = kColors[index];
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
