class NoteModel {
  final String title;
  final String note;
  final String date;
  final bool isPinned;
  final bool inTrash;

  NoteModel({
    required this.title,
    required this.note,
    required this.date,
    required this.isPinned,
    required this.inTrash,
  });
}
