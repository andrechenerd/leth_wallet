import 'package:leather/logic/models/transaction.dart';

import 'activity.dart';


class Wallet {
  final String address;
  final String menmonicPhrase;
  final String privateKey;
  final List<Transaction> transactions;
  final List<Activity> activities;

  List<String> get splitedMnemonic => menmonicPhrase.split(" ");

  Wallet({
    required this.address,
    required this.menmonicPhrase,
    required this.privateKey,
    required this.transactions,
    required this.activities,
  });

  Wallet copyWith({
    String? address,
    String? menmonicPhrase,
    String? privateKey,
    List<Transaction>? transactions,
    List<Activity>? activities,
  }) {
    return Wallet(
      address: address ?? this.address,
      menmonicPhrase: menmonicPhrase ?? this.menmonicPhrase,
      privateKey: privateKey ?? this.privateKey,
      transactions: transactions ?? this.transactions,
      activities: activities ?? this.activities,
    );
  }

double get countedMoneyInDollars =>
    activities.fold(0.0, (sum, activity) => sum + activity.cryptoPriceInDollars);
}
