class TaskModel {
  final int? id;
  final String title;
  final String description;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': description,
    };
  }
}
