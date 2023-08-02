import 'dart:io';
import 'TaskManager/task_manager.dart';
import 'io/ioManager.dart';

void main() {
  TaskManager taskManager = TaskManager();
  print("=============== Welcome to Task Manager ===============");

  bool running = true;
  while (running) {
    print("""
            What do you want to do? \n
            A) Add a task \n
            B) View all tasks \n
            C) Edit a task \n
            D) Complete a task \n
            E) Remove a task \n
            F) Exit""");

    String? input = stdin.readLineSync();
    input = input!.toUpperCase();

    switch (input) {
      case "A":
        addTask(taskManager);
        break;
      case "B":
        viewTask(taskManager);
        break;
      case "C":
        editTask(taskManager);
        break;
      case "D":
        completeTask(taskManager);
        break;
      case "E":
        removeTask(taskManager);
        break;
      case "F":
        print("Bye!");
        running = false;
        break;
      default:
        print("Invalid input");
    }
    print("=====================================================");
  }
}
