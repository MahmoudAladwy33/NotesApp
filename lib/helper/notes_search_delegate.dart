import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Views/edit_note_view.dart';
import 'package:notes_app/Widgets/note_item.dart';

class NotesSearchDelegate extends SearchDelegate {
  final List<NoteModel> notes;

  NotesSearchDelegate({
    required this.notes,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Please enter a search term'),
      );
    }

    final results = notes.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.subTitle.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final note = results[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              EditNote.id,
              arguments: note,
            );
            close(context, null);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 36,
              right: 36,
              bottom: 8,
              top: 16,
            ),
            child: NoteItem(note: note),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    final suggestions = notes.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.subTitle.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return SizedBox(
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final note = suggestions[index];
          return GestureDetector(
              onTap: () {
                close(context, null);
                query = note.title;
                showResults(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 36,
                  right: 36,
                  bottom: 8,
                  top: 16,
                ),
                child: NoteItem(
                  note: note,
                ),
              ));
        },
      ),
    );
  }
}

class NoteDetailScreen extends StatelessWidget {
  final NoteModel note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              note.subTitle,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
