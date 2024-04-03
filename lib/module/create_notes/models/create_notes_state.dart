import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../models/note_model.dart';

part 'create_notes_state.freezed.dart';

@freezed
class CreateNotesState with _$CreateNotesState {
  const factory CreateNotesState({
    required TextEditingController titleEditingController,
    required TextEditingController noteEditingController,
    NoteModel? noteData,
  }) = _CreateNotesState;
}
