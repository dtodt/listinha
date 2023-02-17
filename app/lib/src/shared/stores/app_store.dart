import 'package:flutter/material.dart';

class AppStore {
  final _syncDate = ValueNotifier<DateTime?>(null);
  final _themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  AppStore();

  void init() {
    // TODO: iniciar os dados na base local
  }
  void save() {
    // TODO: salvar os dados na base local
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
}
