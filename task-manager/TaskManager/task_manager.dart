import 'task.dart';

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  List<Task> viewTasks() {
    return tasks;
  }

  List<Task> viewCompletedTasks() {
   return tasks.where((task) => task.status == 'completed').toList();
  }

   List<Task> viewPendingTasks() {
   return tasks.where((task) => task.status == 'pending').toList();
  }
  
  Task? editTask(int? taskId,
      {String? title, String? description, DateTime? date}) {
    if (taskId != null && taskId >= 0 && taskId < tasks.length) {
      Task task = tasks[taskId];

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
    if (taskid < tasks.length) {
      Task task = tasks[taskid];
      task.status = "completed";
      return task;
    }
    return null;
  }

  Task? removeTask(int taskid) {
    if (taskid < tasks.length) {
      Task task = tasks.removeAt(taskid);
      return task;
    }
    return null;
  }
}
