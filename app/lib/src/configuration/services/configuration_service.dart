import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationService {
  void init();
  void deleteAll();
}

class RealmConfigurationService implements ConfigurationService, Disposable {
  final Realm _realm;
  final AppStore _appStore;

  late final RxDisposer _disposer;

  RealmConfigurationService(this._realm, this._appStore);

  @override
  void init() {
    final model = _getConfiguration();

    _appStore
      ..syncDate = model.syncDate
      ..themeMode = _getThemeModeByName(model.themeModeName);

    _disposer = rxObserver(() {
      final themeMode = _appStore.themeMode;
      final syncDate = _appStore.syncDate;

      _saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    _realm.deleteAll();
  }

  @override
  void dispose() {
    _disposer();
  }

  ConfigurationModel _getConfiguration() {
    return _realm.all<ConfigurationModel>().first;
  }

  void _saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getConfiguration();
    _realm.write(() {
      model
        ..syncDate = syncDate
        ..themeModeName = themeModeName;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
