import 'package:flutter/material.dart';
import 'package:mws_responsi/app/service/todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class Task {
  String id;
  String text;
  bool isCompleted;

  Task({required this.id, required this.text, this.isCompleted = false});
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final response = await show();

      if (response['success']) {
        setState(() {
          tasks = (response['data'] as List)
              .map((item) => Task(
                  id: item['id'],
                  text: item['todo'],
                  isCompleted: item['status'] == "aktif" ? false : true))
              .toList();
        });
      }
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  void _addTask(String text) async {
    try {
      final id = "todo-${DateTime.now().millisecondsSinceEpoch.toString()}";
      await store(id, text, false);
      setState(() {
        tasks.add(Task(id: id, text: text));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding task: $e')),
      );
    }

    _textController.clear();
  }

  void _editTask(String id, int index, String newText) async {
    try {
      await update(id, newText);
      setState(() {
        tasks[index].text = newText;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating task: $e')),
      );
    }
  }

  void _toggleTask(String id, int index) async {
    try {
      await activate(id, !tasks[index].isCompleted);
      setState(() {
        tasks[index].isCompleted = !tasks[index].isCompleted;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating task: $e')),
      );
    }
  }

  void _deleteTask(String id, int index) async {
    try {
      await delete(id);
      setState(() {
        tasks.removeAt(index);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting task: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (_) => _toggleTask(tasks[index].id, index),
                  ),
                  title: Text(
                    tasks[index].text,
                    style: TextStyle(
                      decoration: tasks[index].isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(context, index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteTask(tasks[index].id, index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new task',
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _addTask(value);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _addTask(_textController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    final TextEditingController _editController =
        TextEditingController(text: tasks[index].text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: _editController,
            decoration: const InputDecoration(hintText: 'Enter new task text'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (_editController.text.isNotEmpty) {
                  _editTask(tasks[index].id, index, _editController.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
