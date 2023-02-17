import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';

class AppStore {
  final ConfigurationService _configurationService;

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
}
