import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  final String date;
  @HiveField(3)
  bool isPinned;
  @HiveField(4)
  bool inTrash;

  NoteModel({
    required this.title,
    required this.note,
    required this.date,
    required this.isPinned,
    required this.inTrash,
  });
}
