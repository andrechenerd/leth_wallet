import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/constants/app_colors.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_button.dart';
import 'package:leather/feathures/home/home_screen.dart';
import 'package:leather/feathures/secret_key/components/check_box/check_box.dart';
import 'package:leather/feathures/secret_key/components/check_box/cubit.dart';
import 'package:leather/feathures/secret_key/components/check_box/state.dart';

import 'components/your_secret_key_widget.dart';

class YourSecretKeyScreen extends StatefulWidget {
  const YourSecretKeyScreen({super.key});

  @override
  State<YourSecretKeyScreen> createState() => _YourSecretKeyScreenState();
}

class _YourSecretKeyScreenState extends State<YourSecretKeyScreen> {
  final CheckBoxCubit cubit = CheckBoxCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxCubit, CheckBoxState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                children: [
                  const Spacer(
                    flex: 149,
                  ),
                  const Text(
                    "Your Secret Key",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 34,
                  ),
                  const Text(
                    "here’s your key:24 words that give you access Leather.If you\nlose your Secret Key,you’ll be unable to access your STF\ntokens.No one can reset it for you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(
                    flex: 50,
                  ),
                  const SecretKeyWidget().symmetricPadding(horizontal: 200),
                  const Spacer(
                    flex: 53,
                  ),
                  Row(
                    children: [
                      CheckBoxWidget(cubit: cubit),
                      const Text(
                        "I have saved my Secret Key",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ).expanded()
                    ],
                  ).symmetricPadding(horizontal: 200),
                  const Spacer(
                    flex: 20,
                  ),
                  AppButton(
                    text: "Continue",
                    onTap: () {
                      if (state.isCheckbox == true) {
                        NavigationService.push(context,
                            page: const HomeScreen());
                      }
                    },
                    isActive: state.isCheckbox == true ? false : true,
                  ).symmetricPadding(horizontal: 200),
                  const Spacer(
                    flex: 100,
                  )
                ],
              ),
            ),
          );
        });
  }
}
