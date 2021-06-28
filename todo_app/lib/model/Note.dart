import 'package:hive/hive.dart';
part 'Note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title = "";
  @HiveField(1)
  String description = "";
  Note(String passedTitle, String passedDescription) {
    this.title = passedTitle;
    this.description = passedDescription;
  }
}
