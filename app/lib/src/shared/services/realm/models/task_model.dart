part of 'task_board_model.dart';

@RealmModel()
class _Task {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool completed = false;
}
