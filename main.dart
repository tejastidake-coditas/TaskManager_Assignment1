import 'dart:io';
import 'TaskManager.dart';

void main() async {
  int option = 0;
  TaskManager taskManager = TaskManager();

  print("\n\nWelcome to Tejas' Task Manager!");

  while (option != 5) {
    print(
        "\n1. Add Task\n2. List Tasks\n3. Mark Task as Completed\n4. Delete Task\n5. Exit\n\n");

    String? str = stdin.readLineSync();

    if (str != null) {
      switch (str) {
        case "1":
          {
            print("Add Task\n");

            print("\nTitle: ");
            String? title = stdin.readLineSync() ?? "";

            print("\nDescription: ");
            String? desc = stdin.readLineSync() ?? "";

            await taskManager.addTask(title, desc);
            break;
          }
        case "2":
          {
            print("List Tasks");
            await taskManager.listTasks();
            break;
          }
        case "3":
          {
            print("Completed/toggle status: Enter id");
            int? id = int.tryParse(stdin.readLineSync() ?? "");

            if (id != null) {
              await taskManager.toggleTaskStatus(id);
            }
            break;
          }
        case "4":
          {
            print("Delete Task: Enter id");
            int? id = int.tryParse(stdin.readLineSync() ?? "");

            if (id != null) {
              await taskManager.deleteTask(id);
            }
            break;
          }
        case "5":
          {
            print("Exiting...");
            option = 5;
            break;
          }
        default:
          {
            print("Select appropriate option");
            break;
          }
      }
    }
  }
}
