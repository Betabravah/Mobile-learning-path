import 'dart:io';
import '../TaskManager/task.dart';
import '../TaskManager/task_manager.dart';

DateTime? handleDateInput(String date) {
  try {
    DateTime? dueDate = DateTime.parse(date);
    return dueDate;
  } catch (e) {
    return null;
  }
}

void addTask(TaskManager taskManager) {
  print("Enter the title of task");
  String? title = stdin.readLineSync();
  print("Enter the description of task");
  String? description = stdin.readLineSync();

  DateTime? dueDate;
  while (dueDate == null) {
    print("Enter the due date of task in (yyyy-mm-dd) format");
    String? date = stdin.readLineSync();
    dueDate = handleDateInput(date!);
  }

  Task task = Task(title, description, dueDate, "pending");
  taskManager.addTask(task);
  print(">>>>>> You added ${task.title} task");
}

void viewTask(TaskManager taskManager) {
  print("What tasks do you want to view? \n"
      "A) All tasks \n"
      "B) Completed tasks \n"
      "C) Pending tasks");

  String? view = stdin.readLineSync();
  view = view!.toUpperCase();

  if (view == "A") {
    List<Task> allTasks = taskManager.viewTasks();
    for (int i = 0; i < allTasks.length; i++) {
      print("Task id - ${i + 1}");
      printTask(allTasks[i]);
    }
    print(">>>>>> You have viewed all tasks");
  } else if (view == "B") {
    List<Task> completedTasks = taskManager.viewCompletedTasks();

    for (int i = 0; i < completedTasks.length; i++) {
      print("Task id - ${i + 1}");
      printTask(completedTasks[i]);
    }
    print(">>>>>> You have viewed completed tasks");
  } else if (view == "C") {
    List<Task> pendingTasks = taskManager.viewPendingTasks();
    for (int i = 0; i < pendingTasks.length; i++) {
      print("Task id - ${i + 1}");
      printTask(pendingTasks[i]);
    }
    print(">>>>>> You have viewed pending tasks");
  } else {
    print("Invalid input");
  }
}

void editTask(TaskManager taskManager) {
  print("Enter the task id");
  String? taskid = stdin.readLineSync();
  print("Enter the new title of task (press enter to skip)");
  String? title = stdin.readLineSync();
  print("Enter the new description of task (press enter to skip)");
  String? description = stdin.readLineSync();
  print(
      "Enter the new due date of task in (yyyy-mm-dd) format (press enter to skip)");
  String? date = stdin.readLineSync();
  DateTime? dueDate = handleDateInput(date!);

  Task? editedTask = taskManager.editTask(
    int.tryParse(taskid!),
    title: title,
    description: description,
    date: dueDate,
  );

  if (editedTask != null) {
    print(">>>>>> You edited task id $taskid");
  } else {
    print(">>>>>> Task id $taskid does not exist");
  }
}

void completeTask(TaskManager taskManager) {
  print("Enter the task id");
  String? taskid = stdin.readLineSync();
  Task? completedTask = taskManager.completeTask(int.parse(taskid!));

  if (completedTask != null) {
    print(">>>>>> You completed task id $taskid");
  } else {
    print(">>>>>> Task id $taskid does not exist");
  }
}

void removeTask(TaskManager taskManager) {
  print("Enter the task id");
  String? taskid = stdin.readLineSync();
  Task? deletedTask = taskManager.removeTask(int.parse(taskid!));

  if (deletedTask != null) {
    print(">>>>>> You removed task id $taskid");
  } else {
    print(">>>>>> Task id $taskid does not exist");
  }
}
