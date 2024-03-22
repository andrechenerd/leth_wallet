import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),color: const Color(0xff1E1E20)),
      child: Row(
        children: [Padding(
          padding: const EdgeInsets.only(right: 5,left: 5),
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(42),color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(42),color: Colors.white),
            )
          ],
        )
        
        ],
      ),
    );
  }
}