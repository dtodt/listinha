import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.read<AppStore>();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final syncDate = context.select(() => appStore.syncDate);
    var syncDateText = 'Nunca';
    if (syncDate != null) {
      final formatter = DateFormat('dd/MM/yyyy às hh:mm');
      syncDateText = formatter.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
            top: 28,
          ),
          child: Text(
            'Opções',
            style: textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                Text(
                  syncDateText,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}




/*

  final _syncDate = ValueNotifier<DateTime?>(null);
  final _themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  AppStore(this._configurationService) {
    init();
  }

  void init() {
    final model = _configurationService.get();
    _syncDate.value = model.syncDate;
    _themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _configurationService.save(themeMode.value.name, syncDate.value);
  }

  void clearAppData() {
    _configurationService.deleteAll();
  }

  ValueNotifier<DateTime?> get syncDate => _syncDate;

  void setSyncDate(DateTime date) {
    _syncDate.value = date;
    save();
  }

  ValueNotifier<ThemeMode> get themeMode => _themeMode;

  void setThemeMode(ThemeMode? mode) {
    if (mode == null) return;
    _themeMode.value = mode;
    save();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }


*/

