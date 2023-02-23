import 'package:flutter/material.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  final AppStore appStore;

  const ConfigurationPage({super.key, required this.appStore});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(() => widget.appStore.themeMode);

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
              groupValue: themeMode,
              value: ThemeMode.light,
              title: Text(
                'Claro',
                style: option,
              ),
              onChanged: _setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              groupValue: themeMode,
              value: ThemeMode.dark,
              title: Text(
                'Escuro',
                style: option,
              ),
              onChanged: _setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              groupValue: themeMode,
              value: ThemeMode.system,
              title: Text(
                'Sistema',
                style: option,
              ),
              onChanged: _setThemeMode,
            ),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: subTitle,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reiniciar o app'),
            ),
          ],
        ),
      ),
    );
  }

  void _setThemeMode(ThemeMode? mode) {
    if (mode == null) return;
    widget.appStore.themeMode = mode;
  }
}
