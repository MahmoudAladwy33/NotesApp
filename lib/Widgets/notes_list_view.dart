import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final data = const [
    Color.fromARGB(255, 249, 105, 95),
    Color.fromARGB(255, 252, 237, 98),
    Color.fromARGB(255, 255, 189, 90),
    Color.fromARGB(255, 125, 255, 129),
    Color.fromARGB(255, 233, 111, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: NoteItem(
              color: data[index % data.length],
            ),
          );
        },
      ),
    );
  }
}
