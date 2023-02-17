import 'package:flutter_modular/flutter_modular.dart';

import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/home_module.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        AutoBind.singleton<AppStore>(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config', child: (_, __) => const ConfigurationPage()),
      ];
}
