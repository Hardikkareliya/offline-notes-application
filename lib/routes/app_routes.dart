part of 'app_pages.dart';

abstract class Routes {
  static const String allNotes = _Paths.allNotes;
  static const String createNote = _Paths.createNote;
}

abstract class _Paths {
  static const String allNotes = '/allNotes';
  static const String createNote = '/createNote';
}
