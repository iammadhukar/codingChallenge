import 'package:coding_chal/pages/home_page.dart';
import 'package:coding_chal/provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountryProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("BuddyBet Coding Challege"),
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
