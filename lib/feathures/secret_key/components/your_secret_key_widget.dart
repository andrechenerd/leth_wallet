import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leather/logic/helpers/wallet_helper.dart';

class SecretKeyWidget extends StatelessWidget {
  const SecretKeyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mneomnic = WalletHelper.currentWallet!.menmonicPhrase;
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: const Color(0xff5D5D5D)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          const Text(
            "Your Secret key",
            style: TextStyle(
                fontSize: 12,
                color: Color(0xffC7C7C7),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8.5,
          ),
          const Divider(
            color: Color(0xff6B6B6B),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            mneomnic,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 11,
          ),
          TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: mneomnic));
              },
              child: const Text(
                "Copy to clipboard",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff5546FF),
                    fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 56,
          ),
        ],
      ),
    );
  }
}
