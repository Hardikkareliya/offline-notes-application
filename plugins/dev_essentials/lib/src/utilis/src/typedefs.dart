part of '../utils.dart';

typedef DevEssentialPageBuilder = Widget Function(
  BuildContext context,
  Object? arguments,
);

typedef OnAppCloseCallback = Future<bool> Function();

typedef SplashUIBuilder = Widget Function(
  Widget? logo,
  Color? backgroundColor,
);

typedef OnSplashInitCallback = Future<String> Function(
  BuildContext splashContext,
);

typedef DevEssentialSvgPicture = SvgPicture;
typedef DevEssentialSvgTheme = SvgTheme;

typedef DevEssentialToast = BotToast;
