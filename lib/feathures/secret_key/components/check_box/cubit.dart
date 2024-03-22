import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super(CheckBoxState.initial());

  void checkBox(bool? newValue) {
    emit(state.copyWith(isCheckbox: newValue));
  }
}
