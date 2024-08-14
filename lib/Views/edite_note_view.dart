import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/edite_view_body.dart';

class EditeNote extends StatelessWidget {
  const EditeNote({super.key});
  static String id = 'edite';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditeViewBody(),
    );
  }
}
