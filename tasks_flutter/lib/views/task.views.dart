import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_flutter/controllers/task.controller.dart';
import 'package:tasks_flutter/models/task.model.dart';
import 'package:tasks_flutter/utils/erro.message.dart';
import 'package:tasks_flutter/utils/menssage_confirm.utils.dart';
import 'package:tasks_flutter/utils/theme.utils.dart';

class TaskListView extends GetView<TaskController> {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchTasks();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (controller.errorMessage.value.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  erroMessage(context, message: controller.errorMessage.value);
                });
              }
              return controller.tasks.isNotEmpty
                  ? Column(
                      children: controller.tasks.map((task) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                          child: Card(
                            child: ListTile(
                              title: Text(task.title),
                              subtitle: Text(task.description),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _editAddTask(context, task),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => messageConfirm(
                                      context,
                                      text: 'Ao confirmar sua tarefa será excluída!',
                                      onPressed: () => controller.deleteTask(task.id!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width / 2),
                      child: const Center(
                        child: Text(
                          'Adicione um Tarefa!',
                          style: addStyle,
                        ),
                      ),
                    );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _editAddTask(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editAddTask(BuildContext context, TaskModel? task) {
    TextEditingController titleController = TextEditingController(text: task != null ? task.title : '');
    TextEditingController descriptionController = TextEditingController(text: task != null ? task.description : '');
    GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Chave para o formulário

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          task != null ? 'Editar Tarefa' : 'Adicionar Tarefa',
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um título';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  maxLines: null, // Permite múltiplas linhas de texto
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCELAR', style: buttonEditStyle),
          ),
          TextButton(
            onPressed: () {
              // Validar os campos do formulário antes de salvar
              if (formKey.currentState!.validate()) {
                task != null
                    ? controller.editTask(
                        task.id!,
                        TaskModel(
                          id: task.id,
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      )
                    : controller.addTask(
                        TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      );
                Navigator.pop(context);
              }
            },
            child: const Text('SALVAR', style: buttonEditStyle),
          ),
        ],
      ),
    );
  }
}
