import 'package:flutter/material.dart';

class AppStore {
  final _themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  ValueNotifier<ThemeMode> get themeMode => _themeMode;

  void setThemeMode(ThemeMode? mode) {
    if (mode == null) return;
    _themeMode.value = mode;
    save();
  }

  void save() {
    // TODO: salvar os dados na base local
  }
}
