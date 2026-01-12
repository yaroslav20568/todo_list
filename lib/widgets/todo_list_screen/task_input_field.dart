import 'package:flutter/material.dart';
import 'package:todo_list/constants/index.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const TaskInputField({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Введите задачу',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: AppColors.surface,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
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
    );
  }
}
