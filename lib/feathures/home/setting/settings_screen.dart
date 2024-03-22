import 'package:flutter/material.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_button.dart';
import 'package:leather/core/ui_components/dialog/add_node_dialog.dart';
import 'package:leather/logic/helpers/hive_helper.dart';
import 'package:leather/logic/helpers/wallet_helper.dart';

import '../../leather/leather_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040404),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 65,
                ),
                const Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Text(
                  'Node settings',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  'Select the node you’d like to use',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 29,
                ),
                const SizedBox(
                  height: 11,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 240,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: const Color(0xff656565))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff0275FF)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hiro Systems node',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Text(
                              'Http//api.hiro.so',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffAEAEAE)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppButton(
                        text: 'Add a node',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AddNodeDialog();
                            },
                          );
                        },
                        bgColor: const Color(0xff5546FF),
                      ).onlyPadding(t: 20),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 1202),
                //   child: AppButton(
                //     text: 'Add a node',
                //     onTap: () {
                //       showDialog(
                //         context: context,
                //         builder: (context) {
                //           return const AddNodeDialog();
                //         },
                //       );
                //     },
                //     bgColor: const Color(0xff5546FF),
                //   ),
                // ),
                const SizedBox(
                  height: 72,
                ),
                const Text(
                  'Theme',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Text(
                  'Your’re currently using the dark theme.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 11,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff5546FF),
                    ),
                    child: const Text(
                      'Use system color mode',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 53,
                ),
                const Text(
                  'Diagnostics',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Diagnostics',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: const Color(0xffD9D9D9),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    const Text(
                      'Anonymous diagnostic information helps us improve the Leather',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                  'Reset wallet',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Text(
                  'When you reset your wallet,you will need to sign back in with your 24-word Secret key.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: const Color(0xff0F0F0F),
                          child: SizedBox(
                            width: 400,
                            height: 200,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  const Spacer(
                                    flex: 50,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 35,
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Reset wallet',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                        Spacer(),
                                        Icon(
                                          Icons.cancel,
                                          size: 18,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 66,
                                  ),
                                  const Text(
                                    'Warning:you may lose funds if you do not have backups of your 24-word Secret key',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const Spacer(
                                    flex: 62,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xff878787))),
                                          child: const Text(
                                            'Celen',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          HiveHelper().clearDb();
                                          WalletHelper.currentWallet = null;
                                          NavigationService.push(context,
                                              page: const LeatherScreen());
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 90,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0xffF34D4D),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xff0F0F0F))),
                                          child: const Text(
                                            'Reset wallet',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(
                                    flex: 31,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF34D4D),
                    ),
                    child: const Text(
                      'Reset wallet',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
