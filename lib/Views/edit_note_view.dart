import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/edit_view_body.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});
  static String id = 'edite';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditViewBody(),
    );
  }
}
