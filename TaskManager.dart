import 'dart:async';
import 'dart:math';

class Task {
  int id;
  String title;
  String desc;
  bool status;

  Task({
    required this.id,
    required this.title,
    required this.desc,
    required this.status,
  });
}

class TaskManager {
  Map<int, Task> taskMap = {};

  Future<void> addTask(String title, String desc) async {
    print("Adding, wait...");
    await Future.delayed(Duration(seconds: 1));
    print("${Random().nextInt(30)}%");
    await Future.delayed(Duration(seconds: 1));
    print("${Random().nextInt(60) + 35}%");
    await Future.delayed(Duration(seconds: 1));
    print("Task Added successfully 😊");

    int newId = taskMap.isEmpty ? 0 : taskMap.keys.last + 1;
    taskMap[newId] = Task(id: newId, title: title, desc: desc, status: false);
  }

  Future<void> listTasks() async {
    print(
        "Total Tasks: ${taskMap.length}\n\nStatus | id | Title | Description\n---------------------------------");
    taskMap.forEach((id, task) {
      print(
          "${(task.status ? "   ◉   | " : "   𝇈   | ")} $id | ${task.title} | ${task.desc}");
    });
  }

  Future<void> toggleTaskStatus(int id) async {
    if (taskMap.containsKey(id)) {
      taskMap[id]!.status = !taskMap[id]!.status;
      print("Task status toggled successfully.");
    } else {
      print("Task with id $id not found.");
    }
  }

  Future<void> deleteTask(int id) async {
    if (taskMap.containsKey(id)) {
      taskMap.remove(id);
      print("Task removed successfully.");
    } else {
      print("Task with id $id not found.");
    }
  }
}
