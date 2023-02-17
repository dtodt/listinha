import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationService {
  ConfigurationModel get();
  void save(String themeModeName, DateTime? syncDate);
  void deleteAll();
}

class RealmConfigurationService implements ConfigurationService {
  final Realm storage;

  const RealmConfigurationService(this.storage);

  @override
  ConfigurationModel get() {
    return storage.all<ConfigurationModel>().first;
  }

  @override
  void save(String themeModeName, DateTime? syncDate) {
    final model = get();
    storage.write(() {
      model
        ..syncDate = syncDate
        ..themeModeName = themeModeName;
    });
  }

  @override
  void deleteAll() {
    storage.deleteAll();
  }
}
