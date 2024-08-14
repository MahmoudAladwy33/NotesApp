import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/cutsom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CutsomTextField(
            hint: 'Title',
          ),
          SizedBox(
            height: 16,
          ),
          CutsomTextField(
            hint: 'Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
