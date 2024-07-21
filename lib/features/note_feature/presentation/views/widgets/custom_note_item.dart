import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Note Title',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Note content',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 28,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              'May 21,2024 ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
