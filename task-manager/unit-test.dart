import 'package:test/test.dart';
import 'TaskManager/task.dart';
import 'TaskManager/task_manager.dart';

void main() {
  group('TaskManager', () {
    late TaskManager taskManager;
    

    setUp(() {
      taskManager = TaskManager();
      taskManager.addTask(Task('Task 1', 'Description 1', DateTime.now(), 'completed'));
      taskManager.addTask(Task('Task 2', 'Description 2', DateTime.now(), 'pending'));
      taskManager.addTask(Task('Task 3', 'Description 3', DateTime.now(), 'pending'));
      taskManager.addTask(Task('Task 4', 'Description 4', DateTime.now(), 'completed'));
      taskManager.addTask(Task('Task 5', 'Description 5', DateTime.now(), 'pending'));
    });

    test('viewCompletedTasks should return only completed tasks', () {
      var completedTasks = taskManager.viewCompletedTasks();
      expect(completedTasks.length, equals(2));
      expect(completedTasks[0].title, equals('Task 1'));
      expect(completedTasks[1].title, equals('Task 4'));
    });

    test('viewPendingTasks should return only pending tasks', () {
      var pendingTasks = taskManager.viewPendingTasks();
      expect(pendingTasks.length, equals(3));
      expect(pendingTasks[0].title, equals('Task 2'));
      expect(pendingTasks[1].title, equals('Task 3'));
      expect(pendingTasks[2].title, equals('Task 5'));
    });

    test('getTaskById returns the correct task', () {
      Task? task = taskManager.getTaskById(2);
      expect(task?.title, equals('Task 2'));
      expect(task?.description, equals('Description 2'));
    });

    test('getTaskById returns null for invalid ID', () {
      Task? task = taskManager.getTaskById(10);
      expect(task, equals(null));
    });
  });
}