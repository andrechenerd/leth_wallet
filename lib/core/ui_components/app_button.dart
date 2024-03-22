import 'package:flutter/material.dart';
import 'package:leather/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final Color? bgColor;
  final bool? isActive;
  final String text;
  final double? height;
  final VoidCallback onTap;
  const AppButton(
      {super.key,
      this.height = 80,
      this.bgColor = const Color(0xff5546FF),
      required this.text,
      required this.onTap,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive == false ? bgColor : bgColor!.withOpacity(0.50),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
      ),
    );
  }
}
