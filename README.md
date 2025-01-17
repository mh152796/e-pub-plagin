# Hive EPUB Reader

A customizable EPUB reader package for Flutter applications that adds EPUB reading capabilities to your app.

## Features

- 📖 EPUB File Reading
- 🎨 Customizable UI
- 🔍 Text Search
- ✨ Text Highlighting
- 📝 Note Taking
- 🔖 Bookmarking
- 🎯 Page Tracking
- 🌙 Dark/Light Theme
- 📱 Responsive Design

## Installation

Add this line to your `pubspec.yaml` file:

```yaml
dependencies:
  hive_epub: ^0.0.1
```

## Usage

### 1. Import the Package

```dart
import 'package:hive_epub/show_epub.dart';
```

### 2. Use the EPUB Reader

```dart
ShowEpub(
  epubBook: epubBook, // EpubBook object
  accentColor: Colors.blue,
  bookId: "unique_book_id",
  chapterListTitle: "Chapters",
  onPageFlip: (currentPage, totalPages) {
    print("Current Page: $currentPage, Total Pages: $totalPages");
  },
  onLastPage: (lastPageIndex) {
    print("Last Page Index: $lastPageIndex");
  },
)
```

### 3. Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| epubBook | EpubBook | EPUB book object |
| accentColor | Color | App's accent color |
| bookId | String | Unique book identifier |
| chapterListTitle | String | Title for chapters list |
| starterChapter | int | Starting chapter (default: 0) |
| shouldOpenDrawer | bool | Whether drawer should be open (default: false) |
| onPageFlip | Function(int, int)? | Callback when page is flipped |
| onLastPage | Function(int)? | Callback when reaching last page |
| lockedChapters | List<int> | List of locked chapters |
| onHighlight | Function(int, int, String)? | Callback when text is highlighted |

### 4. Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:hive_epub/show_epub.dart';
import 'package:epubx/epubx.dart';

class EpubReaderScreen extends StatelessWidget {
  final EpubBook epubBook;
  
  const EpubReaderScreen({Key? key, required this.epubBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowEpub(
        epubBook: epubBook,
        accentColor: Theme.of(context).primaryColor,
        bookId: "book_1",
        chapterListTitle: "Chapters",
        onPageFlip: (currentPage, totalPages) {
          print("Current Page: $currentPage");
        },
        onLastPage: (lastPageIndex) {
          print("Reached last page!");
        },
        lockedChapters: [3, 4, 5], // Chapters 3, 4, 5 are locked
        onHighlight: (startIndex, endIndex, color) {
          print("Text has been highlighted");
        },
      ),
    );
  }
}
```

## Feature Usage

### Text Search
- Click on the search icon
- Enter text
- Press Enter or click search icon

### Text Highlighting
- Select text
- Choose highlight option
- Pick a color

### Adding Notes
- Select text
- Choose note option
- Write your note

### Bookmarks
- Click bookmark icon
- Access later from bookmarks list

## Additional Features

### Theme Customization
The reader supports both light and dark themes, with customizable:
- Background colors
- Text colors
- Font sizes
- Font families

### Page Navigation
- Swipe left/right to change pages
- Chapter navigation through drawer
- Progress tracking across sessions

### Text Selection Features
- Copy text
- Highlight text with custom colors
- Add notes to selected text

### Reading Progress
- Automatic bookmark saving
- Last read position recovery
- Chapter progress tracking

## Requirements

- Flutter SDK: >=3.1.0 <4.0.0
- Dart SDK: >=3.1.0 <4.0.0

## Dependencies

This package uses several Flutter packages for enhanced functionality:
- epubx: ^4.0.0
- flutter_html_reborn: ^3.0.0
- screen_brightness: ^1.0.1
- get_storage: ^2.1.1
- flutter_screenutil: ^5.9.0
- And more...

