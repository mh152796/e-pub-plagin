
import 'package:isar/isar.dart';
import 'bookmark_model.dart';
import 'highlight_model.dart';
import 'note_model.dart';

part 'book_progress_model.g.dart';

@collection
@Name("BookProgressModel")
class BookProgressModel {
  Id id = Isar.autoIncrement;

  late String bookId;
  late int currentPageIndex;
  late int currentChapterIndex;
  List<Bookmark> bookmarks = [];
  List<Highlight> highlights = []; // Add this line
  List<NoteModel> notes = []; // Add this line

  BookProgressModel({
    required this.bookId,
    required this.currentPageIndex,
    required this.currentChapterIndex,
  });
}