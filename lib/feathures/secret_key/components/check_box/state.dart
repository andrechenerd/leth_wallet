// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CheckBoxState extends Equatable {
  final bool isCheckbox;
  const CheckBoxState({
    required this.isCheckbox,
  });

  CheckBoxState copyWith({
    bool? isCheckbox,
  }) {
    return CheckBoxState(
      isCheckbox: isCheckbox ?? this.isCheckbox,
    );
  }

  @override
  List<Object> get props => [
        isCheckbox,
      ];

  factory CheckBoxState.initial() {
    return const CheckBoxState(
      isCheckbox: false,
    );
  }
}
