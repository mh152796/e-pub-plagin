
import 'package:hive_epub/Model/book_progress_model.dart';
import 'package:hive_epub/Model/bookmark_model.dart';
import 'package:hive_epub/Model/highlight_model.dart';
import 'package:hive_epub/Model/note_model.dart';
import 'package:isar/isar.dart';

class BookProgressSingleton {
  final Isar isar;

  BookProgressSingleton({required this.isar});

  Future<bool> setCurrentChapterIndex(String bookId, int chapterIndex) async {
    try {
      BookProgressModel? oldBookProgressModel = await isar.bookProgressModels
          .where()
          .filter()
          .bookIdEqualTo(bookId)
          .findFirst();

      if (oldBookProgressModel != null) {
        oldBookProgressModel.currentChapterIndex = chapterIndex;
        await isar.writeTxn(() async {
          isar.bookProgressModels.put(oldBookProgressModel);
        });
      } else {
        var newBookProgressModel = BookProgressModel(
            currentPageIndex: 0,
            currentChapterIndex: chapterIndex,
            bookId: bookId);
        await isar.writeTxn(() async {
          isar.bookProgressModels.put(newBookProgressModel);
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setCurrentPageIndex(String bookId, int pageIndex) async {
    try {
      BookProgressModel? oldBookProgressModel = await isar.bookProgressModels
          .where()
          .filter()
          .bookIdEqualTo(bookId)
          .findFirst();

      if (oldBookProgressModel != null) {
        oldBookProgressModel.currentPageIndex = pageIndex;
        await isar.writeTxn(() async {
          isar.bookProgressModels.put(oldBookProgressModel);
        });
      } else {
        var newBookProgressModel = BookProgressModel(
            currentPageIndex: pageIndex,
            currentChapterIndex: 0,
            bookId: bookId);
        await isar.writeTxn(() async {
          isar.bookProgressModels.put(newBookProgressModel);
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  BookProgressModel getBookProgress(String bookId) {
    var newBookProgressModel = BookProgressModel(currentPageIndex: 0, currentChapterIndex: 0, bookId: bookId);

    try {
      BookProgressModel? oldBookProgressModel = isar.bookProgressModels
          .where()
          .filter()
          .bookIdEqualTo(bookId)
          .findFirstSync();
      if (oldBookProgressModel != null) {
        return oldBookProgressModel;
      } else {
        return newBookProgressModel;
      }
    } on Exception {
      return newBookProgressModel;
    }
  }


  Future<bool> deleteBookProgress(String bookId) async {
    try {
      await isar.writeTxn(() async {
        await isar.bookProgressModels
            .where()
            .filter()
            .bookIdEqualTo(bookId)
            .deleteAll();
      });
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> deleteAllBooksProgress() async {
    try {
      await isar.writeTxn(() async {
        await isar.bookProgressModels.where().deleteAll();
      });
      return true;
    } on Exception {
      return false;
    }
  }




  Future<void> addBookmark(String bookId, int chapterIndex, int pageIndex) async {
    var bookProgress = getBookProgress(bookId);

    bookProgress.bookmarks = List.from(bookProgress.bookmarks); // Convert to growable list
    bookProgress.bookmarks.add(Bookmark(chapterIndex: chapterIndex, pageIndex: pageIndex));

   // bookProgress.bookmarks.add(Bookmark(chapterIndex: chapterIndex, pageIndex: pageIndex));
    await isar.writeTxn(() async {
      await isar.bookProgressModels.put(bookProgress);
    });
    print('bookProgress.bookmarks.length: ${bookProgress.bookmarks.length}');
  }


/// Highlight Feature Method Start
  Future<void> addHighlight(String bookId, int chapterIndex, int startIndex, int endIndex, String color , String content) async {
    var bookProgress = getBookProgress(bookId);
    bookProgress.highlights = List.from(bookProgress.highlights); // Convert to growable list
    bookProgress.highlights.add(Highlight(
      chapterIndex: chapterIndex,
      startIndex: startIndex,
      endIndex: endIndex,
      color: color,
      content: content,
    ));
    await isar.writeTxn(() async {
      await isar.bookProgressModels.put(bookProgress);
    });
  }

  Future<void> removeHighlight(String bookId, int chapterIndex, int startIndex, int endIndex) async {
    var bookProgress = getBookProgress(bookId);
    bookProgress.highlights.removeWhere((highlight) =>
    highlight.chapterIndex == chapterIndex &&
        highlight.startIndex == startIndex &&
        highlight.endIndex == endIndex
    );
    await isar.writeTxn(() async {
      await isar.bookProgressModels.put(bookProgress);
    });
  }

  List<Highlight> getHighlights(String bookId, int chapterIndex) {
    var bookProgress = getBookProgress(bookId);
    return bookProgress.highlights.where((highlight) => highlight.chapterIndex == chapterIndex).toList();
  }

  Future<void> addNote(String bookId, String note, String content) async {
    var bookProgress = getBookProgress(bookId);
    bookProgress.notes = List.from(bookProgress.notes); // Convert to growable list
    bookProgress.notes.add(NoteModel(
      note: note,
      content: content,
      createdAt: DateTime.now(),
    ));
    await isar.writeTxn(() async {
      await isar.bookProgressModels.put(bookProgress);
    });
  }

  Future<void> removeNote(String bookId, String note) async {
    var bookProgress = getBookProgress(bookId);
    bookProgress.notes.removeWhere((noteModel) => noteModel.note == note);
    await isar.writeTxn(() async {
      await isar.bookProgressModels.put(bookProgress);
    });
  }









}
// Compare this snippet from lib/Helpers/progress_singleton.dart:
