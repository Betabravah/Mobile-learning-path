import 'task.dart';

class TaskManager {
  
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  Task? getTaskById(int id) {
    if (id <= tasks.length) {
      return tasks[id - 1];
    }
    return null;
  }

  List<Task> viewTasks() {
    return tasks;
  }

  List<Task> viewCompletedTasks() {
  List<Task> completedTasks = [];
  tasks.forEach((element) {
    if (element.status == "completed") {
      completedTasks.add(element);
    }
  });
  return completedTasks;
}

  List<Task> viewPendingTasks() {
    List<Task> pendingTasks = [];
    tasks.forEach((element) { 
      if (element.status == "pending") {
        pendingTasks.add(element);
      }});
    return pendingTasks;
  }

    Task? editTask(int? taskId, {String? title, String? description, DateTime? date}) {
    if (taskId != null && taskId <= tasks.length) {
      Task task = tasks[taskId - 1];

      if (title != null) {
        task.title = title;
      }
      if (description != null) {
        task.description = description;
      }
      if (date != null) {
        task.date = date;
      }
      
      return task;
    }
    return null;
  }

  Task? completeTask(int taskid) {
    if (taskid <= tasks.length) {
      Task task = tasks[taskid - 1];
      task.status = "completed";
      return task;
    }
    return null;
  }

  Task? removeTask(int taskid) {
    if (taskid <= tasks.length) {
      Task task = tasks.removeAt(taskid - 1);
      return task;
    }
    return null;
  }
}

