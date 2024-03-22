import 'package:flutter/material.dart';
import 'package:leather/app/navigation/navigation_service.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/dialog/receive_dialog.dart';
import 'package:leather/core/ui_components/home_screen_widget.dart';

import 'setting/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040404),
      body: Padding(
        padding: const EdgeInsets.only(left: 49),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    NavigationService.push(context,
                        page: const SettingsScreen());
                  },
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ).onlyPadding(t: 15, r: 30),
                )
              ],
            ),
            const Spacer(
              flex: 160,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Total balance',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'View on Explore',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7F80FF)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/icons/arrow_right.png',
                  width: 15,
                ),
                const Spacer(),
              ],
            ),
            const Spacer(
              flex: 53,
            ),
            const Text(
              '0 STX',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Spacer(
              flex: 38,
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 70,
                    width: 170,
                    decoration: BoxDecoration(
                        color: const Color(0xff5546FF).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/arrow_up.png',
                          width: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Send',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ReceiveDialog();
                      },
                    );
                  },
                  child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xff5546FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/arrow_down.png',
                            width: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Receive',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      )),
                ),
                const Spacer()
              ],
            ),
            const Spacer(
              flex: 72,
            ),
            Container(
              width: 450,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: const Color(0xff4F4F4F))),
              child: const Column(
                children: [
                  Spacer(
                    flex: 92,
                  ),
                  HomeScreenWidget(),
                  Spacer(
                    flex: 25,
                  ),
                  HomeScreenWidget(),
                  Spacer(
                    flex: 25,
                  ),
                  HomeScreenWidget(),
                  Spacer(
                    flex: 20,
                  ),
                  Text(
                    'You haven’t made any transactions yet',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xffA1A1A1)),
                  ),
                  Spacer(
                    flex: 93,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
