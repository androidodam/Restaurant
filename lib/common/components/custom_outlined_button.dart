import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Size? size;
  final Color? textColor;
  final double? borderRadius;
  final CustomButtonStatus status;
  final VoidCallback? onTap;
  final String? title;
  final String? icon;
  final double? textSize;
  const CustomOutlinedButton({
    super.key,
    this.size,
    this.textColor,
    this.borderRadius,
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
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            fixedSize: size ?? Size(1.sw(context), 48.h),
            side: BorderSide(
              color: theme.grey,
              width: 1.o,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5.o),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title ?? '',
            style: theme.testStyle.copyWith(
              color: textColor ?? theme.grey,
              fontSize: textSize ?? 14.o,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case CustomButtonStatus.ICON:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            fixedSize: size ?? Size(1.sw(context), 48.h),
            side: BorderSide(
              color: theme.grey,
              width: 1.o,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5.o),
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                icon ?? '',
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              Text(
                title ?? '',
                style: theme.testStyle.copyWith(
                  color: textColor ?? theme.greyAccent2,
                  fontSize: textSize ?? 13.o,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 24,
                height: 24,
              ),
            ],
          ),
        );
    }
  }
}
