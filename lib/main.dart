import 'package:coding_chal/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BuddyBet Coding Challege"),
        ),
        body: const HomePage(),
      ),
    ),
  );
}
