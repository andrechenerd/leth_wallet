import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';

class PrivateKeyHelper {
  static String getPrivateKeyFromMnemonic(String mnemonic) {
        const hdPath = "m/44'/60'/0'/0/0";
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    final firstChild = root.derivePath("$hdPath/0");
    final privateKey = HEX.encode(firstChild.privateKey as List<int>);
    return privateKey;
  }
}