import 'package:daily_quotes/common/extensions/num.dart';
import 'package:daily_quotes/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? textSize;
  final double? radius;
  final Widget? icon;
  final Color? textColor;

  const AppFilledButton({
    required this.text,
    required this.onTap,
    super.key,
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.radius,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w ?? 293.w,
      height: height?.h ?? 45.h,
      decoration: BoxDecoration(
        color: color,
        gradient: LinearGradient(
          colors: [
            color ?? R.colors.primary1,
            color ?? R.colors.primary2,
          ],
        ),
        borderRadius: BorderRadius.circular(radius ?? 12.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 2,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?.r ?? 12.r),
          ),
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(
            width?.w ?? 333.w,
            height?.h ?? 48.h,
          ),
          maximumSize: Size(
            width?.w ?? 333.w,
            height?.h ?? 48.h,
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor ?? R.colors.white,
                fontSize: textSize ?? 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (icon != null) ...[4.wb, icon!],
          ],
        ),
      ),
    );
  }
}
