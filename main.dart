import 'dart:io';
import 'TaskManager/task_manager.dart';
import 'io/ioManager.dart';

void main() {
  TaskManager taskManager = TaskManager();
  print("=============== Welcome to Task Manager ===============");
  while (true) {
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

    if (input == "A") {
      addTask(taskManager);
    } else if (input == "B") {
      viewTask(taskManager);
    } else if (input == "C") {
      editTask(taskManager);
    } else if (input == "D") {
      completeTask(taskManager);
    } else if (input == "E") {
      removeTask(taskManager);
    } else if (input == "F") {
      print("Bye!");
      break;
    } else {
      print("Invalid input");
    }
    print("====================================");
  }
}
