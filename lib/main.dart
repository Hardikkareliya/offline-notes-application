import 'dart:io';

import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_first_mobile_application/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';

import 'core/theme/app_theme.dart';
import 'models/note_model.dart';

var encryptionKey = [
  112,
  181,
  104,
  130,
  11,
  90,
  178,
  195,
  252,
  68,
  6,
  162,
  15,
  255,
  114,
  54,
  209,
  65,
  203,
  238,
  137,
  172,
  124,
  120,
  163,
  163,
  207,
  110,
  232,
  247,
  111,
  165
];

void main() async {
  Dev.engine;
  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(
    'noteBox',
    encryptionCipher: HiveAesCipher(encryptionKey),
  );


  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevEssentialMaterialApp(
      debugShowCheckedModeBanner: false,
      useToastNotification: true,
      showDevicePreview: false,
      title: 'Hive Notes',
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      pages: AppPages.rootPages,
      splashConfig: SplashConfig(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        splashDuration: 3.seconds,
        showVersionNumber: false,
        routeAfterSplash: (BuildContext splashContext) async {
          return Routes.allNotes;
        },
      ),
    );
  }
}
