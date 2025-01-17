import 'package:isar/isar.dart';

part 'bookmark_model.g.dart';

@embedded
class Bookmark {
  late int? chapterIndex;
  late int? pageIndex;

  Bookmark({ this.chapterIndex,  this.pageIndex});
}