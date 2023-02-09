import 'package:flutter/material.dart';
import 'package:listinha/main.dart';

import 'themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listinha',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
