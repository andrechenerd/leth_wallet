import 'package:flutter/material.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_textfield.dart';

class ReceiveDialog extends StatefulWidget {
  const ReceiveDialog({super.key});

  @override
  State<ReceiveDialog> createState() => _ReceiveDialogState();
}

class _ReceiveDialogState extends State<ReceiveDialog> {
  final ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 1.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff191818),
            border: Border.all(width: 1, color: const Color(0xff999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              children: [
                Text(
                  "Receive STX",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.509)),
                ).onlyPadding(l: 54),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ).onlyPadding(r: 60).expanded())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xffB4B4B4),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              "Unlock your wallet",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.50),
                  fontWeight: FontWeight.w700),
            ).onlyPadding(l: 54),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/icons/warning.png",
                  color: const Color(0xffB4B4B4),
                  width: 28,
                  height: 28,
                ).onlyPadding(l: 48),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  "Enter your password to reveal your STX address.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.50)),
                ).expanded()
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
                    ctrl: ctrl,
                    onChanged: (p0) {
                      setState(() {});
                    },
                    bgColor: const Color(0xff040404),
                    text: "Enter your password",
                    border: true)
                .expanded()
                .onlyPadding(l: 50, r: 200),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 220,
              height: 70,
              decoration: BoxDecoration(
                  color: ctrl.text.isEmpty
                      ? const Color(0xff5546FF).withOpacity(0.50)
                      : const Color(0xff5546FF),
                  borderRadius: BorderRadius.circular(9)),
              child: Text(
                "Reveal STX address",
                style: TextStyle(
                    fontSize: 14,
                    color: ctrl.text.isEmpty
                        ? Colors.white.withOpacity(0.50)
                        : Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ).onlyPadding(l: 54),
            const SizedBox(
              height: 5,
            ),
            ctrl.text.isEmpty
                ? Row(
                    children: [
                      Image.asset(
                        "assets/icons/warning.png",
                        width: 21,
                        height: 21,
                      ).onlyPadding(l: 54),
                      const Text(
                        "Unable to decrypt wallet",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF0000),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
            const SizedBox(
              height: 32,
            ),
            const Divider(
              color: Color(0xffB4B4B4),
            ),
            const SizedBox(
              height: 7,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: 129,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.white.withOpacity(0.50)),
                    borderRadius: BorderRadius.circular(9)),
                child: const Text(
                  "Close",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ).onlyPadding(r: 46).align(alignment: Alignment.centerRight),
            ),
          ],
        ),
      ),
    );
  }
}
