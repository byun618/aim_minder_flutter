import 'package:aim_minder_flutter/src/pages/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aim Minder',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1D2025),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1D2025),
          elevation: 0,
        ),
      ),
      home: const RootPage(),
    );
  }
}
