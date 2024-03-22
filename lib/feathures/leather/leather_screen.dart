import 'package:flutter/material.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/constants/app_colors.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/feathures/secret_key/your_secret_key.dart';

import '../../core/ui_components/app_button.dart';
import '../../logic/wallet_actions/create_wallet.dart';
import '../sign_in_wallet/sign_in_screen.dart';

class LeatherScreen extends StatefulWidget {
  const LeatherScreen({super.key});

  @override
  State<LeatherScreen> createState() => _LeatherScreenState();
}

class _LeatherScreenState extends State<LeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 305,
            ),
            const Text(
              "Leather",
              style: TextStyle(fontSize: 27, color: AppColors.white),
            ),
            const Spacer(
              flex: 28,
            ),
            const Text(
              "Manage your holdings,and earn Bitcoin by participating in\nStacking",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffE9E9E9),
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(
              flex: 28,
            ),
            AppButton(
              onTap: () {
                CreateWallet().execute().then((value) {
                  NavigationService.push(context,
                      page: const YourSecretKeyScreen());
                });
              },
              text: "Create a new wallet",
            ).symmetricPadding(horizontal: 300),
            const Spacer(
              flex: 16,
            ),
            AppButton(
              bgColor: const Color(0xff151136),
              onTap: () {
                NavigationService.push(context,
                    page: const SignInYourWalletScreen());
              },
              text: "I already have a wallet",
            ).symmetricPadding(horizontal: 300),
            const Spacer(
              flex: 310,
            ),
          ],
        ),
      ),
    );
  }
}
