import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_flutter/models/task.model.dart';
import 'package:tasks_flutter/services/task_api.service.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = RxString('');

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading.value = true;

      List<TaskModel> fetchedTasks = await TaksApiService().getTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
      errorMessage.value = 'Erro ao  buscar as Tarefas';
    } finally {
      isLoading.value = false;
    }
  }

  void addTask(TaskModel task) async {
    try {
      isLoading.value = true;

      TaskModel createdTask = await TaksApiService().createTask(task);
      tasks.add(createdTask);
    } catch (e) {
      errorMessage.value = 'Erro ao adicionar uma Tarefa!';
    } finally {
      isLoading.value = false;
    }
  }

  void editTask(int id, TaskModel task) async {
    try {
      isLoading.value = true;

      TaskModel updatedTask = await TaksApiService().updateTask(id, task);
      int index = tasks.indexWhere((element) => element.id == id);
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    } catch (e) {
      errorMessage.value = 'Erro ao Atualizar a tarefa!';
    } finally {
      isLoading.value = false;
    }
  }

  void deleteTask(int id) async {
    try {
      isLoading.value = true;
      await TaksApiService().deleteTask(id);
      tasks.removeWhere((element) => element.id == id);
    } catch (e) {
      errorMessage.value = 'Erro ao excluir a Tarefa!';
    } finally {
      isLoading.value = false;
    }
  }
}
