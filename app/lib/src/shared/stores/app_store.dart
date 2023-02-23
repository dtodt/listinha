import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final _syncDate = RxNotifier<DateTime?>(null);
  final _themeMode = RxNotifier<ThemeMode>(ThemeMode.system);

  DateTime? get syncDate => _syncDate.value;
  set syncDate(DateTime? date) => _syncDate.value = date;

  ThemeMode get themeMode => _themeMode.value;
  set themeMode(ThemeMode mode) => _themeMode.value = mode;
}
