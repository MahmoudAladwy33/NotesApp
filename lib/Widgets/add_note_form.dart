import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/colors_list_view.dart';
import 'package:notes_app/Widgets/custom_button.dart';
import 'package:notes_app/Widgets/cutsom_text_field.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/helper/success_snack_bar.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CutsomTextField(
            onSaved: (data) {
              title = data;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CutsomTextField(
            onSaved: (data) {
              content = data;
            },
            hint: 'Type something ...',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: content!,
                      date: DateFormat('yyyy-MM-dd / kk:mm').format(now),
                      color: Colors.green.value,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    successSnackBar(context, 'Add note success');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
