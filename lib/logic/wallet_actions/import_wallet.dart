import 'package:dio/dio.dart';

import '../apis/api.dart';
import '../helpers/hive_helper.dart';
import '../helpers/private_key_helper.dart';
import '../helpers/wallet_helper.dart';
import '../models/activity.dart';
import '../models/transaction.dart';
import '../models/wallet.dart';

class ImportWallet {
  Future<Wallet> execute(String mnemonic, {bool saveInDb = true}) async {
    try {
      final res = await WalletAPI().createWallet(mnemonic);
      final data = Map<String, dynamic>.from(res.data);
      final privateKey = PrivateKeyHelper.getPrivateKeyFromMnemonic(mnemonic);
      final transactions = List<Map<String, dynamic>>.from(data["transactions"])
          .map((e) => Transaction.fromMap(e["attributes"]))
          .toList();
      final positions = List<Map<String, dynamic>>.from(data["positions"])
          .map((e) => Activity.fromMap(e["attributes"]))
          .toList();
      final wallet = Wallet(
        address: data["address"],
        menmonicPhrase: mnemonic,
        privateKey: privateKey,
        activities: positions,
        transactions: transactions,
      );
      WalletHelper.currentWallet = wallet;
      if (saveInDb) {
        await HiveHelper().saveMnemonic(mnemonic);
      }
      return wallet;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
