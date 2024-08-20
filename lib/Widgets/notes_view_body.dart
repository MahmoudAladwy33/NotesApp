import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/notes_list_view.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          NotesListView(),
        ],
      ),
    );
  }
}
