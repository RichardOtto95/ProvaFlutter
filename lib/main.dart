import 'package:flutter/material.dart';
import 'package:prova_flutter/login_page.dart';
import 'package:prova_flutter/shared/constants/theme_constants.dart';
import 'package:prova_flutter/shared/utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProvaFlutter',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      // brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      home: const LoginPage(),
    );
  }
}
