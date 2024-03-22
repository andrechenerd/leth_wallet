import 'package:flutter/material.dart';
import 'package:leather/feathures/secret_key/components/check_box/cubit.dart';

class CheckBoxWidget extends StatelessWidget {
  final CheckBoxCubit cubit;
  const CheckBoxWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.black,
      activeColor: const Color(0xffD9D9D9),
      value: cubit.state.isCheckbox,
      onChanged: (value) {
        cubit.checkBox(value);
      },
    );
  }
}
