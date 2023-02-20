import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import 'models/configuration_model.dart';
import 'models/task_board_model.dart';

LocalConfiguration get config => Configuration.local(
      [
        ConfigurationModel.schema,
        Task.schema,
        TaskBoard.schema,
      ],
      initialDataCallback: (realm) {
        realm.add(ConfigurationModel(ThemeMode.system.name));
      },
    );
