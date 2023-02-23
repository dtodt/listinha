import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final appStore = Modular.get<AppStore>();
  final configurationService = Modular.get<ConfigurationService>();

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    final themeMode = context.select(() => appStore.themeMode);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeMode,
      title: 'Listinha',
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }

  @override
  void initState() {
    super.initState();

    configurationService.init();
  }
}
