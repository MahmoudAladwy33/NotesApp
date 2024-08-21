import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/cutsom_text_field.dart';
import 'package:notes_app/Widgets/edit_note_colors_list.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/success_snack_bar.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              successSnackBar(context, 'Edit note success');
            },
            title: 'Edite Notes',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CutsomTextField(
            onChanged: (data) {
              title = data;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CutsomTextField(
            onChanged: (data) {
              content = data;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
