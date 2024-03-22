import 'package:dio/dio.dart';
import 'package:bip39/bip39.dart' as bip39;

import '../apis/api.dart';
import '../helpers/hive_helper.dart';
import '../helpers/private_key_helper.dart';
import '../helpers/wallet_helper.dart';
import '../models/activity.dart';
import '../models/transaction.dart';
import '../models/wallet.dart';

class CreateWallet {
  Future<Wallet> execute({int wordsCount = 12}) async {
    try {
      final mnemonic = bip39.generateMnemonic(
        strength: _getStrengthFromCount(wordsCount),
      );
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
      await HiveHelper().saveMnemonic(mnemonic);
      return wallet;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  int _getStrengthFromCount(int count) {
    switch (count) {
      case 15:
        return 160;
      case 18:
        return 192;
      case 21:
        return 224;
      case 24:
        return 256;
      default:
        return 128;
    }
  }
}
