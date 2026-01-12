import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/index.dart';

class StorageService {
  static const String _tasksKey = 'tasks';

  Future<List<Task>> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getString(_tasksKey);
      if (tasksJson == null) {
        return [];
      }
      final List<dynamic> tasksList = json.decode(tasksJson) as List<dynamic>;
      return tasksList
          .map((taskJson) => Task.fromJson(taskJson as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> saveTasks(List<Task> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = json.encode(
        tasks.map((task) => task.toJson()).toList(),
      );
      return await prefs.setString(_tasksKey, tasksJson);
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_tasksKey);
    } catch (e) {
      return false;
    }
  }
}
