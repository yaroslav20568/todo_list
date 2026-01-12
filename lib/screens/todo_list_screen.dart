import 'package:flutter/material.dart';
import 'package:todo_list/constants/index.dart';
import 'package:todo_list/models/index.dart';
import 'package:todo_list/services/index.dart';
import 'package:todo_list/widgets/index.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textController = TextEditingController();
  final StorageService _storageService = StorageService();
  final List<Task> _tasks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    final tasks = await _storageService.loadTasks();
    setState(() {
      _tasks.clear();
      _tasks.addAll(tasks);
      _isLoading = false;
    });
  }

  Future<void> _saveTasks() async {
    await _storageService.saveTasks(_tasks);
  }

  Future<void> _addTask() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: text,
      status: TaskStatus.pending,
      createdAt: DateTime.now(),
    );

    setState(() {
      _tasks.add(newTask);
    });

    _textController.clear();
    await _saveTasks();
  }

  Future<void> _deleteTask(String taskId) async {
    setState(() {
      _tasks.removeWhere((task) => task.id == taskId);
    });
    await _saveTasks();
  }

  Future<void> _changeStatus(String taskId) async {
    setState(() {
      final index = _tasks.indexWhere((task) => task.id == taskId);
      if (index != -1) {
        final task = _tasks[index];
        TaskStatus newStatus;
        switch (task.status) {
          case TaskStatus.pending:
            newStatus = TaskStatus.inProgress;
            break;
          case TaskStatus.inProgress:
            newStatus = TaskStatus.completed;
            break;
          case TaskStatus.completed:
            newStatus = TaskStatus.pending;
            break;
        }
        _tasks[index] = task.copyWith(status: newStatus);
      }
    });
    await _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      body: Column(
        children: [
          TaskInputField(controller: _textController, onAdd: _addTask),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _tasks.isEmpty
                ? const EmptyTasksView()
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return TaskItem(
                        task: task,
                        onDelete: () => _deleteTask(task.id),
                        onChangeStatus: () => _changeStatus(task.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
