import 'package:flutter/material.dart';
import 'package:todo_app/model/Note.dart';
import 'package:todo_app/pages/add_note-page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesPage extends StatelessWidget {
  var notesBox = Hive.box('notes');

  List<Note> notes = [];

  void getNotes() {
    for (int i = 0; i < notesBox.length; i++) {
      notes.add(notesBox.getAt(i));
      print(notes[i].title);
    }
  }

  @override
  void initState() {
    print('I am in initState');
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    getNotes();
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
