import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/cutsom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edite Notes',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CutsomTextField(hint: 'Title'),
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
