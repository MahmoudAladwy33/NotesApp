import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/notes_list_view.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/notes_search_delegate.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  NoteModel? noteModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              List<NoteModel> notes =
                  BlocProvider.of<NotesCubit>(context).notes ?? [];

              return CustomAppBar(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: NotesSearchDelegate(
                      notes: notes,
                    ),
                  );
                },
                title: 'Notes',
                icon: Icons.search,
              );
            },
          ),
          const NotesListView(),
        ],
      ),
    );
  }
}
