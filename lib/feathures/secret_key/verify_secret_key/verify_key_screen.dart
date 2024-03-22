import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/constants/app_colors.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_button.dart';
import 'package:leather/core/ui_components/app_textfield.dart';
import 'package:leather/feathures/secret_key/verify_secret_key/cubit.dart';
import 'package:leather/feathures/secret_key/verify_secret_key/state.dart';
import 'package:leather/feathures/set_password/set_password_screen.dart';

import '../../../logic/wallet_actions/import_wallet.dart';

class VerifiySecretKey extends StatefulWidget {
  const VerifiySecretKey({super.key});

  @override
  State<VerifiySecretKey> createState() => _VerifiySecretKeyState();
}

class _VerifiySecretKeyState extends State<VerifiySecretKey> {
  String phrase = '';
  List<String> splited = [];
  final ctrl = TextEditingController();
  final String secretKey = "Secret Key";
  final ImportWalletCubit cubit = ImportWalletCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: BlocBuilder<ImportWalletCubit, ImportWalletScreenState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(
                  flex: 291,
                ),
                const Text(
                  "Verifiy Secret Key",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                const Spacer(flex: 10),
                const Text(
                  "Enter your Secret Key to confirm you’ve saved it",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                const Spacer(
                  flex: 74,
                ),
                AppTextField(
                        ctrl: ctrl,
                        onChanged: (p0) {
                          splited = p0.trim().split(" ");
                          cubit.setRecoveryWords(splited);
                          setState(() {});
                        },
                        bgColor: AppColors.black,
                        text: "24-word Secret Key",
                        border: true)
                    .symmetricPadding(horizontal: 120),
                const Spacer(
                  flex: 8,
                ),
                ctrl.text.isEmpty && splited.length != 24
                    ? Row(
                        children: [
                          Image.asset(
                            "assets/icons/warning.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "The Secret key you’ve entered doesn’t match",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFF0000),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ).symmetricPadding(horizontal: 120)
                    : const SizedBox(),
                const Spacer(
                  flex: 57,
                ),
                AppButton(
                    isActive: splited.length == 24 && ctrl.text.isNotEmpty
                        ? false
                        : true,
                    text: "Continue",
                    onTap: () {
                      if (ctrl.text.isNotEmpty && splited.length == 24) {
                        _saveAndNavigate();
                      }
                    }).symmetricPadding(horizontal: 100),
                const Spacer(
                  flex: 28,
                ),
                const Text(
                  "View Secret Key again",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffAFAFAF),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xffAFAFAF),
                  ),
                ),
                const Spacer(
                  flex: 141,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _saveAndNavigate() {
    ImportWallet().execute(phrase).then((value) {
      NavigationService.push(context, page: const SetPasswordScreen());
    });
  }
}
