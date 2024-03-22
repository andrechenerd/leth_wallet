import 'package:flutter/material.dart';
import 'package:leather/core/extensions/widget_extensions.dart';
import 'package:leather/core/ui_components/app_textfield.dart';

import '../../constants/app_colors.dart';

class AddNodeDialog extends StatefulWidget {
  const AddNodeDialog({super.key});

  @override
  State<AddNodeDialog> createState() => _AddNodeDialogState();
}

class _AddNodeDialogState extends State<AddNodeDialog> {
  final nameCtrl = TextEditingController();
  final urlCtrl = TextEditingController();

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
                  "Add a node",
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
              height: 19,
            ),
            Text(
              "Enter an address for a Stacks Blockchain API that proxies a Stacks\nnode.Before using a node,makes sure you review and trust the host\nbefore cinfiguring a new API.",
              style: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(0.50)),
            ).onlyPadding(l: 54),
            const SizedBox(
              height: 27,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.50),
                  fontWeight: FontWeight.w700),
            ).onlyPadding(l: 54),
            const SizedBox(
              height: 9,
            ),
            AppTextField(
                    ctrl: nameCtrl,
                    onChanged: (p0) {
                      setState(() {});
                    },
                    bgColor: AppColors.black,
                    text: "Some APi instrance",
                    border: true)
                .symmetricPadding(horizontal: 50),
            const SizedBox(
              height: 19,
            ),
            Text(
              "URL",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.50),
                  fontWeight: FontWeight.w700),
            ).onlyPadding(l: 54),
            const SizedBox(
              height: 9,
            ),
            AppTextField(
                    ctrl: urlCtrl,
                    onChanged: (p0) {
                      setState(() {});
                    },
                    bgColor: AppColors.black,
                    text: "http;//api.hiro.so",
                    border: true)
                .symmetricPadding(horizontal: 50),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Color(0xff424242),
            ),
            Row(
              children: [
                const Spacer(),
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
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ).onlyPadding(r: 17),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 129,
                  height: 70,
                  decoration: BoxDecoration(
                      color: nameCtrl.text.isEmpty || urlCtrl.text.isEmpty
                          ? const Color(0xff5546FF).withOpacity(0.30)
                          : const Color(0xff5546FF),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Text(
                    "Add node",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ).onlyPadding(r: 40)
              ],
            )
          ],
        ),
      ),
    );
  }
}
