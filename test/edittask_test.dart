import 'package:test/test.dart';
import '../task-manager/TaskManager/task.dart';
import '../task-manager/TaskManager/task_manager.dart';

void main() {
  test('Edit task', () {
    TaskManager taskManager = TaskManager();
    bool isNull = true;
    taskManager.addTask(
        Task("Task 1", "Description 1", DateTime(2023, 8, 1), "pending"));
    taskManager.addTask(
        Task("Task 2", "Description 2", DateTime(2023, 8, 2), "completed"));
    taskManager.addTask(
        Task("Task 3", "Description 3", DateTime(2023, 8, 3), "completed"));

    //testing edit task
    Task? editedTask = taskManager.editTask(2,
        title: "Edited Task 2", date: DateTime(2023, 8, 5));
    expect(editedTask, !isNull);
    expect(editedTask!.title, "Edited Task 2");
    expect(editedTask.description, "Description 2");
    expect(editedTask.date, DateTime(2023, 8, 5));

    //testing completed tasks
    List<Task> completedTasks = taskManager.viewCompletedTasks();
    expect(completedTasks.length, 2);
    expect(completedTasks[0].title, "Task 2");
    expect(completedTasks[1].title, "Task 3");

    // testing pending tasks
    List<Task> pendingTasks = taskManager.viewPendingTasks();
    expect(pendingTasks.length, 1);
    expect(pendingTasks[0].title, "Task 1");
  });
  
}
