// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final HiveHelper _instance = HiveHelper._internal();

  factory HiveHelper() {
    return _instance;
  }
  HiveHelper._internal();

  late final Box _db;

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _db = await Hive.openBox("app_box");
    } catch (e) {}
  }

  Future<void> clearDb() async {
    try {
      await _db.clear();
    } catch (e) {}
  }

  Future<void> saveMnemonic(String mnemonic) async {
    try {
      List<String> res = List<String>.from(_db.get("mnemonics") ?? []);
      res = res.toSet().toList();
      res.add(mnemonic);
      await _db.put("mnemonics", res);
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveCurrencyCode(
    String currencyCode,
  ) async {
    try {
      await _db.put("currency", currencyCode);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setIsNotFirstAppOpen() async {
    try {
      await _db.put("is_first_app_open", false);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setPassword(String password) async {
    try {
      await _db.put("password", password);
    } catch (e) {
      print(e);
    }
  }

  String? get password => _db.get("password");

  bool get isFirstAppOpen => _db.get("is_first_app_open") ?? true;

  List<String> get savedMnemonics {
    try {
      List<String> res = List<String>.from(_db.get("mnemonics") ?? []);
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  String? get savedCurrency {
    try {
      final currencyCode = _db.get("currency");
      return currencyCode;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
