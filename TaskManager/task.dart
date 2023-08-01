class Task {
  String? title;
  String? description;
  DateTime? date;
  String? status;

  Task(this.title, this.description, this.date, this.status );
}

void printTask(Task task) {
  print("""
        Title: ${task.title} \n
        Description: ${task.description} \n
        Due date: ${task.date} \n
        Status: ${task.status}""");
}