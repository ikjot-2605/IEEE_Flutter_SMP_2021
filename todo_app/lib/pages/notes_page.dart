import 'package:flutter/material.dart';
import 'package:todo_app/model/Note.dart';
import 'package:todo_app/pages/add_note-page.dart';

class NotesPage extends StatelessWidget {
  List<Note> notes = [];
  NotesPage(List<Note> notes) {
    this.notes = notes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotePage()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].description),
          );
        },
      ),
    );
  }
}
