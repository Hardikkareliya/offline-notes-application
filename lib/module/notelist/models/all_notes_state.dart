import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/note_model.dart';

part 'all_notes_state.freezed.dart';

@freezed
class AllNotesState with _$AllNotesState {
  const factory AllNotesState({
    @Default([]) List<NoteModel> noteList,
  }) = _AllNotesState;
}
