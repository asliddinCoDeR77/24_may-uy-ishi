import 'package:flutter/material.dart';
import 'package:ux_2dars/views/screens/screen_1.dart';
import 'package:ux_2dars/views/screens/uy_ishi_2.dart';
import 'package:ux_2dars/views/screens/uy_ishi_3.dart';
import 'package:ux_2dars/views/screens/uy_shi_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const ImageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
