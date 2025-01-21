
import 'package:hive_epub/Model/book_progress_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

const SCHEMES = [BookProgressModelSchema];

class IsarService {
  late final Isar isar;

  IsarService._create(this.isar);

  static Future<Isar> buildIsarService() async {
    final dir = await getApplicationDocumentsDirectory();

    var isarInstance = Isar.getInstance('hive_epub');

    if (isarInstance == null) {
      final isar = await Isar.open(
        [BookProgressModelSchema],
        name: 'hive_epub',
        directory: dir.path,
        inspector: false,
      );

      IsarService._create(isar);
      return isar;
    } else {
      return isarInstance;
    }
  }
}
