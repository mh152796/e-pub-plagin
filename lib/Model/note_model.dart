import 'package:isar/isar.dart';

part 'note_model.g.dart';

@embedded
class NoteModel {
  late String? note;
  late String? content;
  late DateTime? createdAt;

  NoteModel({
    this.note,
    this.content,
    this.createdAt,
  });
}