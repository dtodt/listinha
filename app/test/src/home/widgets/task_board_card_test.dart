import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_board_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_board_model.dart';
import 'package:realm/realm.dart';

const dummy = Colors.transparent;
const error = Colors.red;
const errorContainer = Colors.redAccent;
const primary = Colors.blue;
const primaryContainer = Colors.blueAccent;
const tertiary = Colors.green;
const tertiaryContainer = Colors.greenAccent;

const colorScheme = ColorScheme(
  error: error,
  errorContainer: errorContainer,
  primary: primary,
  primaryContainer: primaryContainer,
  tertiary: tertiary,
  tertiaryContainer: tertiaryContainer,
  brightness: Brightness.light,
  onPrimary: dummy,
  secondary: dummy,
  onSecondary: dummy,
  onError: dummy,
  background: dummy,
  onBackground: dummy,
  surface: dummy,
  onSurface: dummy,
);

void main() {
  final board = TaskBoard(Uuid.v4(), 'title');
  final disabledBoard = TaskBoard(Uuid.v4(), 'title', enabled: false);
  final tasks = [
    Task(Uuid.v4(), '', completed: true),
    Task(Uuid.v4(), '', completed: true),
    Task(Uuid.v4(), ''),
    Task(Uuid.v4(), ''),
  ];

  test('getBackgroundColor', () {
    final card = TaskBoardCard(board: board);

    final completed = card.getBackgroundColor(
      TaskBoardCardStatus.completed,
      colorScheme,
    );
    expect(completed, equals(tertiaryContainer));

    final disabled = card.getBackgroundColor(
      TaskBoardCardStatus.disabled,
      colorScheme,
    );
    expect(disabled, equals(errorContainer));

    final pending = card.getBackgroundColor(
      TaskBoardCardStatus.pending,
      colorScheme,
    );
    expect(pending, equals(primaryContainer));
  });

  test('getColor', () {
    final card = TaskBoardCard(board: board);

    final completed = card.getColor(
      TaskBoardCardStatus.completed,
      colorScheme,
    );
    expect(completed, equals(tertiary));

    final disabled = card.getColor(
      TaskBoardCardStatus.disabled,
      colorScheme,
    );
    expect(disabled, equals(error));

    final pending = card.getColor(
      TaskBoardCardStatus.pending,
      colorScheme,
    );
    expect(pending, equals(primary));
  });

  test('getProgress', () {
    final card = TaskBoardCard(board: board);

    final progress = card.getProgress(tasks);
    expect(progress, equals(0.5));

    final emptyProgress = card.getProgress([]);
    expect(emptyProgress, isZero);
  });

  test('getProgressText', () {
    final card = TaskBoardCard(board: board);

    final progress = card.getProgressText(tasks);
    expect(progress, equals('2/4'));

    final emptyProgress = card.getProgressText([]);
    expect(emptyProgress, equals('0/0'));
  });

  test('getStatus', () {
    final card = TaskBoardCard(board: board);

    final completed = card.getStatus(board, 1);
    expect(completed, equals(TaskBoardCardStatus.completed));

    final disabled = card.getStatus(disabledBoard, 0);
    expect(disabled, equals(TaskBoardCardStatus.disabled));

    final pending = card.getStatus(board, 0.5);
    expect(pending, equals(TaskBoardCardStatus.pending));
  });
}
