import 'package:flutter/material.dart';
import 'package:todo_app/model/Note.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/notes_page.dart';

class AddNotePage extends StatelessWidget {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  var notesBox = Hive.box('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NotesPage()));
          },
        ),
        title: Text("Add Note"),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.exit_to_app),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   )
        // ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "Enter title here..."),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Description"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _descriptionController,
              decoration:
                  InputDecoration(hintText: "Enter description here..."),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (_titleController.text == null ||
                  _descriptionController.text == null ||
                  _titleController.text.length == 0 ||
                  _descriptionController.text.length == 0) {
                print('Empty Fields');
              } else {
                notesBox.add(
                    Note(_titleController.text, _descriptionController.text));
                print(notesBox.length);
              }
            },
            child: Text('Add Note'),
          ),
        ],
      ),
    );
  }
}
