import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_mobile_application/models/note_model.dart';

import '../../../core/theme/app_theme.dart';
import '../../../routes/app_pages.dart';
import '../cubit/all_notes_cubit.dart';
import '../models/all_notes_state.dart';

class AllNoteView extends StatelessWidget {
  const AllNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesCubit, AllNotesState>(builder: (context, state) {
      AllNotesCubit cubit = BlocProvider.of<AllNotesCubit>(context);
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'All Notes',
              style: Dev.theme.textTheme.titleLarge?.copyWith(
                color: AppColors.white,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Dev.toNamed(Routes.createNote),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Add Note'),
                    ],
                  ),
                ),
              )
            ],
            backgroundColor: AppColors.primary,
          ),
          body: SafeArea(
            child: ScrollableScaffoldWrapper(
              color: AppColors.paleRose,
              shrinkWrap: true,
              slivers: [
               SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  sliver: cubit.noteDataBox.values.isNotEmpty
                      ? SliverList.builder(
                          itemCount: state.noteList.length,
                          itemBuilder: (context, index) {
                            final NoteModel noteItem = state.noteList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => Dev.toNamed(Routes.createNote,
                                    arguments: noteItem),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                noteItem.title.toString(),
                                                style: Dev
                                                    .theme.textTheme.titleLarge,
                                              ),
                                              Text(
                                                noteItem.notes.toString(),
                                                style: Dev
                                                    .theme.textTheme.titleSmall,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // const Spacer(),
                                        GestureDetector(
                                          onTap: () =>
                                              cubit.deleteNote(noteItem, index),
                                          child: const Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : SliverFillRemaining(
                          child: Center(
                            child: Text(
                              'No Data Found',
                              style: Dev.theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ));
    });
  }
}
