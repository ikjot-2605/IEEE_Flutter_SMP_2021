import 'package:flutter/material.dart';
import 'package:todo_app/model/Note.dart';

class NotesPage extends StatelessWidget {
  List<Note> notes = [];
  NotesPage(List<Note> notes) {
    this.notes = notes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(notes[index].title);
        },
      ),
    );
  }
}
