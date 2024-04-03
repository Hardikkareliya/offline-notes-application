import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:offline_first_mobile_application/core/theme/app_theme.dart';

import '../../../models/note_model.dart';
import '../models/create_notes_state.dart';

class CreateNoteCubit extends Cubit<CreateNotesState> {
  CreateNoteCubit()
      : super(
          CreateNotesState(
            titleEditingController: TextEditingController(),
            noteEditingController: TextEditingController(),
          ),
        );
  Box<NoteModel> noteDataBox = Hive.box<NoteModel>('noteBox');

  void onInit() {
    if (Dev.arguments != null) {
      NoteModel noteModel = Dev.arguments as NoteModel;
      emit(state.copyWith(noteData: noteModel));
      state.titleEditingController.text = noteModel.title.toString();
      state.noteEditingController.text = noteModel.notes.toString();
    }
  }

  Future<void> saveNotes() async {
    String title = state.titleEditingController.text;
    String notesContain = state.noteEditingController.text;
    if (notesContain.isEmpty || title.isEmpty) {
      'Title or note body cannot be empty'
          .showToast(contentColor: AppColors.black);
      return;
    } else {
      if (state.noteData != null) {
        NoteModel noteM = NoteModel(
          id: state.noteData?.id,
          title: title,
          notes: notesContain,
          dateTime: DateTime.now().toString(),
        );
        int index = noteDataBox.values
            .toList()
            .indexWhere((element) => element.id == noteM.id);
        await noteDataBox.put(noteDataBox.keys.toList()[index], noteM);
        'Note Edit Successfully'.showToast(contentColor: AppColors.black);
      } else {
        NoteModel noteM = NoteModel(
          id: HiveIdGenerator.generateId(),
          title: title,
          notes: notesContain,
          dateTime: DateTime.now().toString(),
        );
        await noteDataBox.add(noteM);

        'Note Saved Successfully'.showToast(contentColor: AppColors.black);
      }

      Dev.back();
    }
  }
}
