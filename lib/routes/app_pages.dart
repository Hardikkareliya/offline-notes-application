import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/create_notes/cubit/create_note_cubit.dart';
import '../module/create_notes/views/create_note_view.dart';
import '../module/notelist/cubit/all_notes_cubit.dart';
import '../module/notelist/views/all_notes_view.dart';

part 'app_routes.dart';

class AppPages {
  static List<DevEssentialPage> rootPages = <DevEssentialPage>[
    DevEssentialPage(
      name: _Paths.allNotes,
      page: (context, arguments) => BlocProvider(
        create: (_) {
          AllNotesCubit noteListCubit = AllNotesCubit();
          noteListCubit.onInit();
          return noteListCubit;
        },
        child: const AllNoteView(),
      ),
    ),
    DevEssentialPage(
      name: _Paths.createNote,
      page: (context, arguments) => BlocProvider(
        create: (_) {
          CreateNoteCubit createNoteCubit = CreateNoteCubit();
          createNoteCubit.onInit();
          return createNoteCubit;
        },
        child: const CreateNoteView(),
      ),
    ),
  ];
}
