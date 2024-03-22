import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leather/feathures/secret_key/verify_secret_key/state.dart';

class ImportWalletCubit extends Cubit<ImportWalletScreenState> {
  ImportWalletCubit() : super(ImportWalletScreenState.initial());

  void setRecoveryWords(List<String> words) {
    emit(state.copyWith(
      recoveryWords: words,
    ));
  }
}
