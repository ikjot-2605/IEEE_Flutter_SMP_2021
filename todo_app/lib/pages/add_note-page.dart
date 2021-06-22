import 'package:flutter/material.dart';
import 'package:todo_app/model/Note.dart';

class AddNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
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
              decoration:
                  InputDecoration(hintText: "Enter description here..."),
            ),
          ),
        ],
      ),
    );
  }
}
