import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_mobile_application/core/theme/app_theme.dart';

import '../../../common/widgets/buttons/common_button.dart';
import '../cubit/create_note_cubit.dart';
import '../models/create_notes_state.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNoteCubit, CreateNotesState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Note',
            style: Dev.theme.textTheme.titleLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
        ),
        body: SafeArea(
          child: ScrollableScaffoldWrapper(
            color: AppColors.paleRose,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: state.titleEditingController,
                        autofocus: false,
                        style: Dev.theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'Enter Title',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: state.noteEditingController,
                        autofocus: false,
                        style: Dev.theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 20,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'Type Note....',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const Spacer(),
                      CommonButton(
                        padding: const EdgeInsets.all(4),
                        text: "Save Note",
                        onPressed: () async =>
                            context.read<CreateNoteCubit>().saveNotes(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
