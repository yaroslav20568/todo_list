import 'package:flutter/material.dart';
import 'package:todo_list/constants/index.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;
  final DateTime? scheduledDateTime;
  final VoidCallback onScheduleTap;

  const TaskInputField({
    super.key,
    required this.controller,
    required this.onAdd,
    this.scheduledDateTime,
    required this.onScheduleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: AppColors.surface,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: scheduledDateTime != null
                        ? AppColors.primary
                        : AppColors.onSurface.withValues(alpha: 0.6),
                  ),
                  onPressed: onScheduleTap,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAdd,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              onSubmitted: (_) => onAdd(),
            ),
          ),
        ],
      ),
    );
  }
}
