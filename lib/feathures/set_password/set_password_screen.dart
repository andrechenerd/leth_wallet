import 'package:flutter/material.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/constants/app_colors.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_button.dart';

import '../../core/ui_components/app_textfield.dart';
import '../home/home_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  String validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required";
    } else if (password.length < 8) {
      return "Not strong enought";
    } else {
      return "Strong";
    }
  }

  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 291,
            ),
            const Text(
              "Set a password",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
            ),
            const Spacer(flex: 10),
            const Text(
              "You;ll use your password when sending transactions.if\nyou forget it,you can restore your wallet from your\nSecret key.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
            const Spacer(
              flex: 58,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/icons/warning.png",
                  color: const Color(0xffB4B4B4),
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Why do i need to set a password?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB4B4B4),
                  ),
                ).expanded()
              ],
            ).symmetricPadding(horizontal: 200),
            const Spacer(
              flex: 10,
            ),
            AppTextField(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    ctrl: ctrl,
                    bgColor: Colors.black,
                    text: "",
                    border: true)
                .symmetricPadding(horizontal: 200),
            const Spacer(
              flex: 10,
            ),
            Row(
              children: [
                const Text(
                  "Password strenght:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffB4B4B4),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  validatePassword(ctrl.text),
                  style: TextStyle(
                    color: ctrl.text.length < 8
                        ? const Color(0xffFF0000)
                        : const Color(0xff00FF57),
                  ),
                )
              ],
            ).symmetricPadding(horizontal: 200),
            const Spacer(
              flex: 59,
            ),
            AppButton(
                isActive: ctrl.text.length < 8 ? true : false,
                text: "Continue",
                onTap: () {
                  if (ctrl.text.length >= 8) {
                    NavigationService.push(context, page: const HomeScreen());
                  }
                }).symmetricPadding(horizontal: 200),
            const Spacer(
              flex: 150,
            ),
          ],
        ),
      ),
    );
  }
}
