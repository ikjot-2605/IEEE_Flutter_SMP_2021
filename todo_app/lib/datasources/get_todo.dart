import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/Note.dart';

class GetNotesDataSource {
  Future<List<Note>> getNotes() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference _collectionRef =
        await FirebaseFirestore.instance.collection("notes");
    QuerySnapshot querySnapshot = await _collectionRef.get();
    List<dynamic> allData = [];
    allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<Note> Notes = [];
    for (int i = 0; i < allData.length; i++) {
      Notes.add(Note(
        allData[i]["title"],
        allData[i]["description"],
      ));
    }
    return Notes;
  }

  Future<void> addNote(String title, String description) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference _collectionRef =
        await FirebaseFirestore.instance.collection("notes");
    await _collectionRef.add({'title': title, 'description': description});
  }
}
