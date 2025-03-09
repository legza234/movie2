import 'package:flutter/material.dart';
import 'package:movie2/ui/screens/home/bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/main",
    routes: {
      "/main": (context) => MainScreen(),
    },
  ));
}
