import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/edit_view_body.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, this.note});

  final NoteModel? note;
  static String id = 'edite';
  @override
  Widget build(BuildContext context) {
    NoteModel noteArg = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: EditViewBody(
        note: noteArg,
      ),
    );
  }
}
