import 'package:realm/realm.dart';

part 'task_board_model.g.dart';
part 'task_model.dart';

@RealmModel()
class _TaskBoard {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late List<_Task> tasks;
  bool enabled = true;
}
