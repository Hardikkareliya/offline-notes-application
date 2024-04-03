import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(1)
  final int? id;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? notes;

  @HiveField(4)
  final String? dateTime;

  NoteModel({
    this.id,
    this.title,
    this.notes,
    this.dateTime,
  });
}

class HiveIdGenerator {
  static int _currentId = 3;

  static int generateId() {
    return _currentId++;
  }

  static void reset() {
    _currentId = 3;
  }
}
