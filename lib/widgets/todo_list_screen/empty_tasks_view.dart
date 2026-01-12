import 'package:flutter/material.dart';
import 'package:todo_list/constants/index.dart';

class EmptyTasksView extends StatelessWidget {
  const EmptyTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Нет задач',
        style: TextStyle(
          color: AppColors.onSurface.withValues(alpha: 0.6),
          fontSize: 16,
        ),
      ),
    );
  }
}
