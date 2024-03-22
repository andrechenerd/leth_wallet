import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'app/app.dart';
import 'logic/helpers/hive_helper.dart';
import 'logic/wallet_actions/import_last_saved_wallet.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper().init();
  await ImportLastSavedWallet().execute();
  runApp(const LeatherApp());
  // getHttp();
}

Future<void> getHttp() async {
  try {
    final http = HttpClient();
    final request = await http
        .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    print(request);
  } catch (e) {
    print(e);
  }
}
