import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';

class CustomButton extends StatelessWidget {
  final Size? size;
  final Color? textColor;
  final double? borderRadius;
  final Color? backgroundColor;
  final CustomButtonStatus status;
  final VoidCallback? onTap;
  final String? title;
  final String? icon;
  final double? textSize;
  const CustomButton({
    super.key,
    this.size,
    this.textColor,
    this.borderRadius,
    this.backgroundColor,
    required this.status,
    this.onTap,
    this.title,
    this.icon,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case CustomButtonStatus.ELEVETED:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: theme.green.withValues(alpha: 0.1),
              backgroundColor: backgroundColor ?? theme.green,
              fixedSize: size ?? Size(1.sw(context), 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.o),
              )),
          onPressed: onTap,
          child: Text(
            title ?? '',
            style: theme.testStyle.copyWith(
              color: textColor ?? theme.white,
              fontSize: textSize ?? 14.o,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case CustomButtonStatus.ICON:
        return SizedBox();
    }
  }
}
