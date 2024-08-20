import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/note_item.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';

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
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
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
        },
      ),
    );
  }
}
