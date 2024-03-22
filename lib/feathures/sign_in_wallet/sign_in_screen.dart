import 'package:flutter/material.dart';
import 'package:leather/core/constants/app_colors.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_button.dart';
import 'package:leather/feathures/set_password/set_password_screen.dart';

import '../../app/navigation/navigation_service.dart';
import '../../core/ui_components/app_textfield.dart';
import '../../logic/wallet_actions/import_wallet.dart';

class SignInYourWalletScreen extends StatefulWidget {
  const SignInYourWalletScreen({super.key});

  @override
  State<SignInYourWalletScreen> createState() => _SignInYourWalletScreenState();
}

class _SignInYourWalletScreenState extends State<SignInYourWalletScreen> {
  final TextEditingController secretKeyCtrl = TextEditingController();
  List<String> splited = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 3,
          ),
          const Center(
            child: Text(
              "Sign in to your wallet",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: const Text(
                  "Secret Key",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ).onlyPadding(b: 20),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          const Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Your Secret Key is a series of random words also known as a seed phrase.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffB0B0B0)),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: AppTextField(
                  maxLines: 6,
                  ctrl: secretKeyCtrl,
                  onChanged: (p0) {
                    setState(() {});
                    splited = secretKeyCtrl.text.split(" ");
                  },
                  bgColor: Colors.black,
                  text: "apple bounce ladder...",
                  border: true,
                ).symmetricPadding(vertical: 10),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: AppButton(
                    isActive: splited.length == 24 && splited.last != ''
                        ? false
                        : true,
                    text: "Continue with Secret Key",
                    onTap: () {
                      ImportWallet().execute(splited.toString()).then((value) {
                        NavigationService.push(context,
                            page: const SetPasswordScreen());
                      });
                    }),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
