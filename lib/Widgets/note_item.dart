import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Views/edit_note_view.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/success_snack_bar.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  double _iconScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNote.id, arguments: widget.note);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(widget.note.color),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                widget.note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  widget.note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: AnimatedScale(
                scale: _iconScale,
                duration: const Duration(milliseconds: 100),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _iconScale = 0.0;
                    });
                    Future.delayed(
                      const Duration(milliseconds: 200),
                      () {
                        widget.note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        successSnackBar(context, 'delete note success');
                      },
                    );
                    setState(() {
                      _iconScale = 1.0;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                  ),
                  color: Colors.black,
                  iconSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                widget.note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
