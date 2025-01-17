import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_epub/Model/highlight_model.dart';
import 'package:hive_epub/PageFlip/page_flip_widget.dart';

import 'custom_toast.dart';

class PagingTextHandler {
  final Function paginate;

  PagingTextHandler(
      {required this.paginate}); // will point to widget show method
}

class PagingWidget extends StatefulWidget {
  final String textContent;
  final String? innerHtmlContent;
  final List<Highlight>? highlights;
  final Function(int startIndex, int endIndex, String color, String content)?
      onHighlight;
  final Function(String note, String content)? onNote;
  final String chapterTitle;
  final int totalChapters;
  final int starterPageIndex;
  final TextStyle style;
  final Function handlerCallback;
  final VoidCallback onTextTap;
  final Function(int, int) onPageFlip;
  final Function(int, int) onLastPage;
  final Widget? lastWidget;

  const PagingWidget(
    this.textContent,
    this.innerHtmlContent, {
    super.key,
    this.style = const TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
    required this.handlerCallback(PagingTextHandler handler),
    required this.onTextTap,
    required this.onPageFlip,
    required this.onLastPage,
    this.starterPageIndex = 0,
    required this.chapterTitle,
    required this.totalChapters,
    this.lastWidget,
    this.highlights,
    this.onHighlight,
    this.onNote,
  });

  @override
  PagingWidgetState createState() => PagingWidgetState();
}

class PagingWidgetState extends State<PagingWidget> {
  final List<String> _pageTexts = [];
  List<Widget> pages = [];
  int _currentPageIndex = 0;
  Future<void> paginateFuture = Future.value(true);
  late RenderBox _initializedRenderBox;
  Widget? lastWidget;

  final _pageKey = GlobalKey();
  final _pageController = GlobalKey<PageFlipWidgetState>();

  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    rePaginate();
    var handler = PagingTextHandler(paginate: rePaginate);
    widget.handlerCallback(handler); // callback call.
    super.initState();
  }

  rePaginate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _initializedRenderBox = context.findRenderObject() as RenderBox;
        paginateFuture = _paginate();
      });
    });
  }

  Future<void> _paginate() async {
    final pageSize = _initializedRenderBox.size;

    _pageTexts.clear();

    final textSpan = TextSpan(
      text: widget.textContent,
      style: widget.style,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: pageSize.width,
    );

    List<LineMetrics> lines = textPainter.computeLineMetrics();
    double currentPageBottom = pageSize.height;
    int currentPageStartIndex = 0;
    int currentPageEndIndex = 0;

    await Future.wait(lines.map((line) async {
      final left = line.left;
      final top = line.baseline - line.ascent;
      final bottom = line.baseline + line.descent;

      var innerHtml = widget.innerHtmlContent;

      if (currentPageBottom < bottom) {
        currentPageEndIndex = textPainter
            .getPositionForOffset(
                Offset(left, top - (innerHtml != null ? 0 : 100.h)))
            .offset;

        var pageText = widget.textContent
            .substring(currentPageStartIndex, currentPageEndIndex);

        _pageTexts.add(pageText);

        currentPageStartIndex = currentPageEndIndex;
        currentPageBottom =
            top + pageSize.height - (innerHtml != null ? 120.h : 150.h);
      }
    }));

    final lastPageText = widget.textContent.substring(currentPageStartIndex);
    _pageTexts.add(lastPageText);

    List<Future<Widget>> futures = _pageTexts.map((text) async {
      return _buildPageContent(text);
    }).toList();

    pages = await Future.wait(futures);
  }

  Widget _buildPageContent(String text) {
    final baseStyle = TextStyle(
      color: widget.style.color,
      fontSize: widget.style.fontSize,
      height: 1.6,
      letterSpacing: 0.5,
      fontFamily: widget.style.fontFamily,
    );

    return InkWell(
      onTap: widget.onTextTap,
      child: Container(
        color: widget.style.backgroundColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            child: Stack(
              children: [
                SelectableText.rich(
                  TextSpan(
                    children: _buildHighlightedText(text),
                    style: baseStyle,
                  ),
                  textAlign: TextAlign.justify,
                  onSelectionChanged: (selection, cause) {
                    if (selection.start >= 0 && selection.end <= text.length) {
                      setState(() {});
                    }
                  },
                  contextMenuBuilder: (context, editableTextState) {
                    final selectedText =
                        editableTextState.textEditingValue.text.substring(
                      editableTextState.textEditingValue.selection.start,
                      editableTextState.textEditingValue.selection.end,
                    );

                    if (selectedText.isEmpty) return Container();

                    return AdaptiveTextSelectionToolbar(
                      anchors: editableTextState.contextMenuAnchors,
                      children: [
                        TextButton(
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: selectedText));
                            editableTextState.hideToolbar();
                          },
                          child: const Text('Copy'),
                        ),
                        TextButton(
                          onPressed: () {
                            showColorPicker(
                              editableTextState
                                  .textEditingValue.selection.start,
                              editableTextState.textEditingValue.selection.end,
                              selectedText,
                            );
                          },
                          child: const Text('Highlight'),
                        ),
                        TextButton(
                          onPressed: () {
                            takeNote(selectedText);
                          },
                          child: const Text('Note'),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = query.isNotEmpty;
      rePaginate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: paginateFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CupertinoActivityIndicator(
                color: Theme.of(context).primaryColor,
                radius: 30.r,
              ),
            );
          default:
            return Column(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    key: _pageKey,
                    child: PageFlipWidget(
                      key: _pageController,
                      initialIndex: widget.starterPageIndex != 0
                          ? (pages.isNotEmpty &&
                                  widget.starterPageIndex < pages.length
                              ? widget.starterPageIndex
                              : 0)
                          : widget.starterPageIndex,
                      onPageFlip: (pageIndex) {
                        _currentPageIndex = pageIndex;
                        widget.onPageFlip(pageIndex, pages.length);
                        if (_currentPageIndex == pages.length - 1) {
                          widget.onLastPage(pageIndex, pages.length);
                        }
                      },
                      backgroundColor:
                          widget.style.backgroundColor ?? Colors.white,
                      lastPage: widget.lastWidget,
                      children: pages,
                    ),
                  ),
                ),
              ],
            );
        }
      },
    );
  }

  void highlightText(
      int startIndex, int endIndex, String color, String content) {
    widget.onHighlight?.call(startIndex, endIndex, color, content);

    // Force immediate update
    setState(() {
      // Clear existing pages and texts
      _pageTexts.clear();
      pages.clear();

      // Trigger repagination
      paginateFuture = _paginate();
    });
  }

  void showColorPicker(int startIndex, int endIndex, String content) {
    showDialog(
      context: context,
      builder: (context) {
        Color pickedColor = Colors.yellow;
        return StatefulBuilder(builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text('Select a color'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: pickedColor,
                onColorChanged: (color) {
                  setDialogState(() {
                    pickedColor = color;
                  });
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  highlightText(
                    startIndex,
                    endIndex,
                    pickedColor.toHexString(),
                    content,
                  );
                },
                child: const Text('Select'),
              ),
            ],
          );
        });
      },
    );
  }



  void takeNote(String content) {
    TextEditingController noteController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.note_add,
                          size: 18,
                          color: Theme.of(context).hintColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add a note',
                          style: TextStyle(
                              fontSize: 14, color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h), // Add some space
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: noteController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your note here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.onNote?.call(noteController.text, content);
                          Navigator.pop(context);
                          CustomToast.showToast('Note added successfully');
                        },
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<TextSpan> _buildHighlightedText(String text) {
    if (widget.highlights == null || widget.highlights!.isEmpty) {
      return [
        TextSpan(
          text: text,
          style: TextStyle(
            color: widget.style.color,
            fontSize: widget.style.fontSize,
            height: 1.6,
            letterSpacing: 0.5,
            fontFamily: widget.style.fontFamily,
          ),
        ),
      ];
    }

    List<TextSpan> spans = [];
    int currentIndex = 0;

    // Sort highlights by start index
    final sortedHighlights = List<Highlight>.from(widget.highlights!)
      ..sort((a, b) => (a.startIndex ?? 0).compareTo(b.startIndex ?? 0));

    for (var highlight in sortedHighlights) {
      if (highlight.startIndex != null &&
          highlight.endIndex != null &&
          highlight.color != null &&
          highlight.content != null) {
        // Check if this highlight's content matches the text at these indices
        if (highlight.startIndex! < text.length &&
            highlight.endIndex! <= text.length) {
          String textAtIndices =
              text.substring(highlight.startIndex!, highlight.endIndex!);

          if (textAtIndices == highlight.content) {
            // Add non-highlighted text before this highlight
            if (currentIndex < highlight.startIndex!) {
              spans.add(TextSpan(
                text: text.substring(currentIndex, highlight.startIndex!),
                style: TextStyle(
                  color: widget.style.color,
                  fontSize: widget.style.fontSize,
                  height: 1.6,
                  letterSpacing: 0.5,
                  fontFamily: widget.style.fontFamily,
                ),
              ));
            }

            // Add highlighted text
            spans.add(TextSpan(
              text: textAtIndices,
              style: TextStyle(
                color: widget.style.color,
                fontSize: widget.style.fontSize,
                height: 1.6,
                letterSpacing: 0.5,
                fontFamily: widget.style.fontFamily,
                backgroundColor: Color(int.parse(highlight.color!, radix: 16))
                    .withOpacity(0.3),
              ),
            ));

            currentIndex = highlight.endIndex!;
          }
        }
      }
    }

    // Add any remaining non-highlighted text
    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
        style: TextStyle(
          color: widget.style.color,
          fontSize: widget.style.fontSize,
          height: 1.6,
          letterSpacing: 0.5,
          fontFamily: widget.style.fontFamily,
        ),
      ));
    }

    return spans;
  }
}
