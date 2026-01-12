import 'package:flutter/material.dart';
import 'package:todo_list/constants/index.dart';
import 'package:todo_list/models/index.dart';
import 'package:todo_list/utils/index.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onChangeStatus;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onChangeStatus,
  });

  Color _getStatusColor() {
    switch (task.status) {
      case TaskStatus.pending:
        return AppColors.pending;
      case TaskStatus.inProgress:
        return AppColors.inProgress;
      case TaskStatus.completed:
        return AppColors.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.status == TaskStatus.completed
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.status.displayName),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  task.scheduledDateTime != null
                      ? Icons.schedule
                      : Icons.calendar_today,
                  size: 14,
                  color: task.scheduledDateTime != null
                      ? AppColors.primary
                      : AppColors.onSurface.withValues(alpha: 0.6),
                ),
                const SizedBox(width: 4),
                Text(
                  task.scheduledDateTime != null
                      ? AppDateUtils.formatDateTime(task.scheduledDateTime!)
                      : 'Created: ${AppDateUtils.formatDate(task.createdAt)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: task.scheduledDateTime != null
                        ? AppColors.primary
                        : AppColors.onSurface.withValues(alpha: 0.6),
                    fontWeight: task.scheduledDateTime != null
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _getStatusColor(),
            shape: BoxShape.circle,
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
          onSelected: (value) {
            if (value == 'delete') {
              onDelete();
            }
          },
        ),
        onTap: onChangeStatus,
      ),
    );
  }
}
