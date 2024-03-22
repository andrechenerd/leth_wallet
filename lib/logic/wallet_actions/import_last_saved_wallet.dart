import '../helpers/hive_helper.dart';
import 'import_wallet.dart';

class ImportLastSavedWallet {
  Future<void> execute() async {
    try {
      final savedMnemonics = HiveHelper().savedMnemonics;
      if (savedMnemonics.isNotEmpty) {
        await ImportWallet().execute(savedMnemonics.last, saveInDb: false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
