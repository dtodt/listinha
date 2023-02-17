import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'models/configuration_model.dart';

LocalConfiguration get config => Configuration.local(
      [
        ConfigurationModel.schema,
      ],
      initialDataCallback: (realm) {
        realm.add(ConfigurationModel(ThemeMode.system.name));
      },
    );
