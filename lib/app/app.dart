import 'package:flutter/material.dart';
import 'package:leather/feathures/leather/leather_screen.dart';

class LeatherApp extends StatelessWidget {
  const LeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LeatherScreen(),
    );
  }
}
