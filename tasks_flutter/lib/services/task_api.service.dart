import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_flutter/models/task.model.dart';

const String apiUrl = 'http://10.0.2.2:8000/api';

class TaksApiService {
  static final TaksApiService _taskApiService = TaksApiService._internal();
  TaksApiService._internal();

  factory TaksApiService() {
    return _taskApiService;
  }

  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(Uri.parse('$apiUrl/task/gets'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => TaskModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<TaskModel> createTask(TaskModel task) async {
    final response = await http.post(
      Uri.parse('$apiUrl/task/create'),
      body: task.toJson(),
    );
    if (response.statusCode == 200) {
      return TaskModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  Future<TaskModel> updateTask(int id, TaskModel task) async {
    final response = await http.put(
      Uri.parse('$apiUrl/task/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );
    if (response.statusCode == 200) {
      return TaskModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/task/delete/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
