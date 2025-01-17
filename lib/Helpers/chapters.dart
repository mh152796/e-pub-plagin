import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/chapter_model.dart';
import '../show_epub.dart';
import 'custom_toast.dart';

// ignore: must_be_immutable
class ChaptersList extends StatelessWidget {
  List<LocalChapterModel> chapters = [];
  final String bookId;
  final Widget? leadingIcon;
  final Color accentColor;
  final String chapterListTitle;
  final List<int> lockedChapters;

  ChaptersList({
    super.key,
    required this.chapters,
    required this.bookId,
    this.leadingIcon,
    required this.accentColor,
    required this.chapterListTitle,
    required this.lockedChapters,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: backColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(
              Icons.close,
              color: fontColor,
              size: 20.h,
            )),
        centerTitle: true,
        title: Text(
          chapterListTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: accentColor, fontSize: 15.sp),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: backColor,
          padding: EdgeInsets.all(10.h),
          child: ListView.builder(
              itemCount: chapters.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                bool isLocked = lockedChapters.contains(i);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () async {
                        if (!isLocked) {
                          await bookProgress.setCurrentChapterIndex(bookId, i);
                          Navigator.of(context).pop(true);
                        } else {
                          CustomToast.showToast("This chapter is locked for free users.");
                        }
                      },
                      leading: leadingIcon,
                      minLeadingWidth: 20.w,
                      title: Padding(
                        padding: EdgeInsets.only(
                            left: chapters[i].isSubChapter ? 15.w : 0),
                        child: Text(chapters[i].chapter,
                            style: TextStyle(
                                color: bookProgress
                                            .getBookProgress(bookId)
                                            .currentChapterIndex ==
                                        i
                                    ? accentColor
                                    : fontColor,
                                fontFamily: fontNames
                                    .where((element) => element == selectedFont)
                                    .first,
                                package: 'hive_epub',
                                fontSize: 15.sp,
                                fontWeight: chapters[i].isSubChapter
                                    ? FontWeight.w400
                                    : FontWeight.w600)),
                      ),
                      trailing: isLocked
                          ? Icon(
                              Icons.lock,
                              color: Colors.red,
                              size: 20.h,
                            )
                          : null,
                      dense: true,
                    ),
                    Divider(height: 0, thickness: 1.h),
                  ],
                );
              }),
        ),
      ),
    );
  }
}