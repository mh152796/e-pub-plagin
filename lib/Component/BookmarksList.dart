import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_epub/Helpers/custom_toast.dart';
import 'package:hive_epub/Helpers/functions.dart';
import 'package:hive_epub/Model/book_progress_model.dart';
import 'package:hive_epub/Model/bookmark_model.dart';
import 'package:hive_epub/Model/highlight_model.dart';
import 'package:hive_epub/Model/note_model.dart';
import 'package:isar/isar.dart';


class BookmarksList extends StatefulWidget {
  final String bookId;
  final Function(int chapterIndex, int pageIndex) onBookmarkTap;

  const BookmarksList({
    super.key,
    required this.bookId,
    required this.onBookmarkTap,
  });

  @override
  _BookmarksListState createState() => _BookmarksListState();
}

class _BookmarksListState extends State<BookmarksList> {
  late Future<List<Bookmark>> _bookmarksFuture;
  late Future<List<Highlight>> _highlightsFuture;
  late Future<List<NoteModel>> _notesFuture;


  @override
  void initState() {
    super.initState();
    _bookmarksFuture = _loadBookmarks();
    _highlightsFuture = _loadHighlights();
    _notesFuture = _loadNotes();
  }

  Future<List<Bookmark>> _loadBookmarks() async {
    final isar = Isar.getInstance('hive_epub');
    if (isar == null) {
      throw Exception('Isar instance is not initialized');
    }

    final bookProgress = isar.bookProgressModels.filter().bookIdEqualTo(widget.bookId).findFirstSync();

    return bookProgress?.bookmarks ?? [];
  }

  Future<List<Highlight>> _loadHighlights() async {
    final isar = Isar.getInstance('hive_epub');
    if (isar == null) {
      throw Exception('Isar instance is not initialized');
    }

    final bookProgress = isar.bookProgressModels.filter().bookIdEqualTo(widget.bookId).findFirstSync();

    return bookProgress?.highlights ?? [];
  }

  Future<List<NoteModel>> _loadNotes() async {
    final isar = Isar.getInstance('hive_epub');
    if (isar == null) {
      throw Exception('Isar instance is not initialized');
    }

    final bookProgress = isar.bookProgressModels.filter().bookIdEqualTo(widget.bookId).findFirstSync();

    return bookProgress?.notes ?? [];
  }

 Future<void> removeNote(String bookId, String note) async {
  final isar = Isar.getInstance('hive_epub');
  if (isar == null) {
    throw Exception('Isar instance is not initialized');
  }

  final bookProgress = isar.bookProgressModels.filter().bookIdEqualTo(bookId).findFirstSync();
  if (bookProgress == null) {
    throw Exception('Book progress not found');
  }

  final notes = bookProgress.notes.toList(); // Convert to growable list
  notes.removeWhere((element) => element.note == note);
  bookProgress.notes = notes; // Update the notes list

  await isar.writeTxn(() async {
    await isar.bookProgressModels.put(bookProgress);
  });

}




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookmarks & Highlights'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.bookmark), text: "Bookmarks"),
              Tab(icon: Icon(Icons.highlight), text: "Highlights"),
              Tab(icon: Icon(Icons.note), text: "Notes"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab for Bookmarks
            FutureBuilder<List<Bookmark>>(
              future: _bookmarksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading bookmarks'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No bookmarks found'));
                } else {
                  final bookmarks = snapshot.data!;
                  return ListView.builder(
                    itemCount: bookmarks.length,
                    itemBuilder: (context, index) {
                      final bookmark = bookmarks[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        leading: const Icon(Icons.bookmark, color: Colors.blue),
                        title: Text(
                          'Chapter: ${bookmark.chapterIndex}, Page: ${bookmark.pageIndex}',
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          widget.onBookmarkTap(bookmark.chapterIndex!, bookmark.pageIndex!);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                }
              },
            ),
            // Tab for Highlights
            FutureBuilder<List<Highlight>>(
              future: _highlightsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading highlights'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No highlights found'));
                } else {
                  final highlights = snapshot.data!.reversed.toList();
                  return ListView.builder(
                    itemCount: highlights.length,
                    itemBuilder: (context, index) {
                      final highlight = highlights[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        leading: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration:  BoxDecoration(
                            color: highlight.color != null ? Color(int.parse('0xFF${highlight.color}')) : Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.highlight, color: Colors.white),
                        ),
                        title: Text(
                          highlight.content ?? 'No text available',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            // Tab for Notes
            FutureBuilder<List<NoteModel>>(
  future: _notesFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return const Center(child: Text('Error loading highlights'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No Note found'));
    } else {
      final note = snapshot.data!.reversed.toList();
      return ListView.builder(
        itemCount: note.length,
        itemBuilder: (context, index) {
          final notes = note[index];
          return ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Note'),
                    content: const Text('Are you sure you want to delete this note?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          log('Deleting note: ${notes.note}');
                          await removeNote(widget.bookId, notes.note!);
                          setState(() {
                            _notesFuture = _loadNotes();
                          });
                          Navigator.of(context).pop();
                          CustomToast.showToast('Note deleted successfully');
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.note, color: Colors.white),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    notes.note ?? 'No text available',
                    style: const TextStyle(fontSize: 16.0),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  getDateTime(notes.createdAt) ?? 'No note available',
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
            subtitle: Container(
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                notes.content ?? 'No note available',
                style: const TextStyle(fontSize: 14.0, color: Colors.blue),
              ),
            ),
          );
        },
      );
    }
  },
)
          ],
        ),
      ),
    );
  }
}
