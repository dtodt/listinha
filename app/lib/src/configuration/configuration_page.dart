import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:listinha/src/shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final title = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final subTitle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final option = textTheme.titleSmall;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Configurações',
              style: title,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: subTitle,
            ),
            const SizedBox(height: 20),
            RadioListTile<ThemeMode>(
              groupValue: appStore.themeMode.value,
              value: ThemeMode.light,
              title: Text(
                'Claro',
                style: option,
              ),
              onChanged: appStore.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              groupValue: appStore.themeMode.value,
              value: ThemeMode.dark,
              title: Text(
                'Escuro',
                style: option,
              ),
              onChanged: appStore.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              groupValue: appStore.themeMode.value,
              value: ThemeMode.system,
              title: Text(
                'Sistema',
                style: option,
              ),
              onChanged: appStore.setThemeMode,
            ),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: subTitle,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: appStore.clearAppData,
              child: const Text('Apagar cache e reiniciar o app'),
            ),
          ],
        ),
      ),
    );
  }
}
