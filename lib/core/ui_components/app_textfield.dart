import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Color bgColor;
  final String text;
  final double? top;
  final double? bottom;
  final TextEditingController? ctrl;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool applyPadding;
  final bool? error;
  final bool border;
  final double? height;
  final int maxLines;
  const AppTextField(
      {super.key,
      required this.bgColor,
      required this.text,
      this.bottom,
      this.top,
      this.ctrl,
      this.error,
      this.suffixIcon,
      this.applyPadding = false,
      this.onChanged,
      required this.border,
      this.height,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.top,
      controller: ctrl,
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(

        enabledBorder: border == false
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: Color(0xff1B1B1B))),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: bgColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        hintText: text,
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.50), fontSize: 14),
      ),
    );
  }
}
