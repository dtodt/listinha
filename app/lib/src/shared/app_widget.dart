import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      title: 'Listinha',
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
