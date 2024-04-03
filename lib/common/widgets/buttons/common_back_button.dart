import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_theme.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    Key? key,
    this.canPop = true,
    this.onPopCalled,
  }) : super(key: key);

  final bool canPop;
  final VoidCallback? onPopCalled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (canPop) {
          Dev.back();
        }
        onPopCalled?.call();
      },
      icon:const Icon(Icons.arrow_back_rounded),
      color: AppColors.black,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      padding: EdgeInsets.zero,
      constraints:
          BoxConstraints.loose(const Size.fromHeight(kMinInteractiveDimension)),
    );
  }
}
