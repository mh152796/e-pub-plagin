import 'package:isar/isar.dart';

part 'highlight_model.g.dart';

@embedded
class Highlight {
  late int? chapterIndex;
  late int? startIndex;
  late int? endIndex;
  late String? color;
  late String? content;

  Highlight({
     this.chapterIndex,
     this.startIndex,
     this.endIndex,
     this.color,
      this.content,
  });
}