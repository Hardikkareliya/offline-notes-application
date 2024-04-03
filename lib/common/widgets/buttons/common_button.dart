import 'package:dev_essentials/dev_essentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/theme/app_theme.dart';

part 'hook.dart';

typedef CommonButtonType = DevEssentialLoadingButtonType;

class CommonButton extends HookWidget {
  const CommonButton({
    Key? key,
    required this.text,
    this.textstyle,
    this.width,
    this.height,
    required this.onPressed,
    this.radius = 100,
    this.icon,
    this.type = CommonButtonType.Elevated,
    this.color,
    this.textColor,
    this.borderColor,
    this.fitWidth = true,
    this.padding,
  })  : _animate = false,
        _iconSize = null,
        textSpacing = null,
        super(key: key);

  const CommonButton.loading({
    Key? key,
    required this.text,
    this.textstyle,
    this.width,
    this.height,
    required this.onPressed,
    this.radius = 8,
    bool animate = true,
    this.type = CommonButtonType.Elevated,
    this.color,
    this.textColor,
    this.borderColor,
    this.fitWidth = true,
    this.padding,
  })  : _animate = animate,
        icon = null,
        _iconSize = null,
        textSpacing = null,
        super(key: key);

  const CommonButton.withIcon({
    Key? key,
    required this.text,
    this.textstyle,
    this.width,
    this.height,
    required this.onPressed,
    this.radius = 8,
    bool animate = true,
    required this.icon,
    double iconSize = 24.0,
    this.type = CommonButtonType.Elevated,
    this.color,
    this.textColor,
    this.borderColor,
    this.fitWidth = true,
    this.textSpacing = 8.0,
    this.padding,
  })  : _animate = animate,
        _iconSize = iconSize,
        super(key: key);

  final String text;
  final TextStyle? textstyle;
  final double? width;
  final double? height;
  final Future<void> Function() onPressed;
  final double radius;
  final bool _animate;

  final Widget? icon;
  final double? _iconSize;
  final CommonButtonType type;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool fitWidth;
  final double? textSpacing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    double defaultIconSize = _iconSize ?? 24.0;
    double spaceBetweenIconAndText = textSpacing ?? 8.0;

    final EdgeInsetsGeometry buttonPadding = padding ??
        ButtonStyleButton.scaledPadding(
          const EdgeInsets.symmetric(horizontal: 16),
          const EdgeInsets.symmetric(horizontal: 16),
          const EdgeInsets.symmetric(horizontal: 16),
          Dev.deviceTextScaleFactor,
        );

    final _CommonButtonHookState buttonState = _useCommonButtonHook(
      width: width ?? double.maxFinite,
      height: height ?? kMinInteractiveDimension,
      iconSize: defaultIconSize,
      buttonColor: color ?? Dev.theme.colorScheme.primary,
      buttonText: text,
      textColor: textColor,
      textstyle: (textstyle ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
        fontWeight: textstyle?.fontWeight ?? FontWeight.w500,
      ),
      buttonType: type,
      fitWidth: fitWidth,
      hasIcon: icon != null,
      spaceBetweenIconAndText: spaceBetweenIconAndText,
      padding: buttonPadding,
    );

    return icon != null
        ? DevEssentialLoadingButton.custom(
            type: type,
            width: buttonState._width,
            height: buttonState._height,
            onPressed: onPressed,
            color: buttonState._buttonColor,
            borderColor: borderColor ?? buttonState._buttonColor,
            borderSide: Divider.createBorderSide(context).copyWith(width: 1.0),
            radius: radius,
            animate: _animate,
            padding: buttonPadding,
            child: _buildIconButton(
              context,
              defaultIconSize,
              spaceBetweenIconAndText,
              buttonState,
            ),
          )
        : DevEssentialLoadingButton(
            type: type,
            width: buttonState._width,
            height: buttonState._height,
            onPressed: onPressed,
            color: buttonState._buttonColor,
            borderColor: borderColor ?? buttonState._buttonColor,
            borderSide: Divider.createBorderSide(context).copyWith(width: 1.0),
            radius: radius,
            animate: _animate,
            padding: buttonPadding,
            buttonText: buttonState._buttonTextSpan.text,
            buttonTextstyle: buttonState._buttonTextSpan.style?.copyWith(
              color: buttonState._textColor,
            ),
          );
  }

  Widget _buildIconButton(
    BuildContext context,
    double defaultIconSize,
    double spaceBetweenIconAndText,
    _CommonButtonHookState buttonState,
  ) {
    return SizedBox(
      height: buttonState._height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: Dev.theme.copyWith(
                iconTheme: Dev.theme.iconTheme.copyWith(
              color: buttonState._textColor,
            )),
            child: SizedBox.square(
              dimension: defaultIconSize,
              child: icon!,
            ),
          ),
          SizedBox(width: spaceBetweenIconAndText),
          Text.rich(
            buttonState._buttonTextSpan,
            textScaler: Dev.textScaler,
            style: buttonState._buttonTextSpan.style?.copyWith(
              color: buttonState._textColor,
            ),
          ),
        ],
      ),
    );
  }
}
