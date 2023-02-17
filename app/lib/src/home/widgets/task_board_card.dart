import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';

const opacity = 0.5;

class TaskBoardCard extends StatelessWidget {
  final TaskBoard board;
  final double height;

  const TaskBoardCard({
    super.key,
    required this.board,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final iconTheme = theme.iconTheme;
    final textTheme = theme.textTheme;

    final opaqueStyle = textTheme.bodySmall?.copyWith(
      color: textTheme.bodySmall?.color?.withOpacity(opacity),
      fontWeight: FontWeight.bold,
    );
    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);
    final status = getStatus(board, progress);
    final titleText = board.title;

    final backgroundColor = getBackgroundColor(status, colorScheme);
    final color = getColor(status, colorScheme);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                status.icon,
                color: iconTheme.color?.withOpacity(opacity),
              ),
              const Spacer(),
              Text(status.text, style: opaqueStyle),
            ],
          ),
          const Spacer(),
          Text(
            titleText,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (board.tasks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(color: color, value: progress),
                const SizedBox(height: 2),
                Text(progressText, style: opaqueStyle),
              ],
            )
        ],
      ),
    );
  }

  Color getBackgroundColor(
    TaskBoardCardStatus status,
    ColorScheme colorScheme,
  ) {
    switch (status) {
      case TaskBoardCardStatus.completed:
        return colorScheme.tertiaryContainer;
      case TaskBoardCardStatus.disabled:
        return colorScheme.errorContainer;
      case TaskBoardCardStatus.pending:
        return colorScheme.primaryContainer;
    }
  }

  Color getColor(
    TaskBoardCardStatus status,
    ColorScheme colorScheme,
  ) {
    switch (status) {
      case TaskBoardCardStatus.completed:
        return colorScheme.tertiary;
      case TaskBoardCardStatus.disabled:
        return colorScheme.error;
      case TaskBoardCardStatus.pending:
        return colorScheme.primary;
    }
  }

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) return 0;

    final completed = tasks.where((task) => task.completed).length;
    return completed / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final completed = tasks.where((task) => task.completed).length;
    return '$completed/${tasks.length}';
  }

  TaskBoardCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enabled) {
      return TaskBoardCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskBoardCardStatus.pending;
    }
    return TaskBoardCardStatus.completed;
  }
}

enum TaskBoardCardStatus {
  completed(Icons.check, 'Completa'),
  disabled(Icons.cancel_outlined, 'Desativada'),
  pending(Icons.access_time, 'Pendente');

  final IconData icon;
  final String text;

  const TaskBoardCardStatus(this.icon, this.text);
}
