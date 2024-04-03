import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:offline_first_mobile_application/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/note_model.dart';
import '../models/all_notes_state.dart';

class AllNotesCubit extends Cubit<AllNotesState> {
  AllNotesCubit() : super(const AllNotesState());
  Box<NoteModel> noteDataBox = Hive.box<NoteModel>('noteBox');

  late StreamSubscription<List<ConnectivityResult>> subscription;
  late SharedPreferences prefs;

  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    checkConnectivity();

    if (noteDataBox.values.isNotEmpty) {
      emit(state.copyWith(noteList: noteDataBox.values.toList()));
    }
  }

  Future<void> deleteNote(NoteModel noteItem, int index) async {
    await noteDataBox.deleteAt(index);
    'Note Delete Successfully'.showToast(contentColor: AppColors.black);
    emit(state.copyWith(noteList: noteDataBox.values.toList()));
  }

  void checkConnectivity() {
    bool isConnected = false;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if ((result.contains(ConnectivityResult.wifi) ||
              result.contains(ConnectivityResult.mobile)) &&
          !isConnected) {
        isConnected = true;

        if (!(prefs.getBool('syncData') ?? false)) {
          syncJsonData();
        }
      } else if (!result.contains(ConnectivityResult.wifi) &&
          !result.contains(ConnectivityResult.mobile)) {
        isConnected = false;
      }
    });
  }

  Future<void> syncJsonData() async {
    return Dev.showOverlay(
      asyncFunction: () async {
        String jsonString =
            await rootBundle.loadString('assets/json/notes.json');
        List<dynamic> data = jsonDecode(jsonString);
        data.map((e) async {
          NoteModel noteM = NoteModel(
            id: e['id'],
            title: e['title'],
            notes: e['notes'],
          );
          await noteDataBox.put(noteM.id, noteM);
        }).toList();
        prefs.setBool('syncData', true);
        emit(
          state.copyWith(
            noteList: noteDataBox.values.toList(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    super.close();
    subscription.cancel();
  }
}
