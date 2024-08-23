import 'package:flutter/material.dart';
import 'add_task.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9395D3)),
        useMaterial3: true,
      ),
      home: const TodoHomePage(title: 'Todo App'),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key, required this.title});

  final String title;

  @override
  State<TodoHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TodoHomePage> {
  // String ? taskTitle;
  List<String> taskTitleArray = [];
  List<String> taskDetailArray = [];

  // Alert dialog box section starts
  Future<void> _showMyDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss the dialog.
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Details',
            style: TextStyle(fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(taskDetailArray[index]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }   // Alert dialog box section ends

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF9395D3),
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_sharp),
            tooltip: 'Calender view',
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskTitleArray.length,
        itemBuilder: (context, index) {
          return 
        // children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsetsDirectional.only(top: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 4, // How wide the shadow spreads
                    blurRadius: 6, // How blurry the shadow is
                    offset: const Offset(0, 3), // Position of the shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 20,
                    ),
                    tooltip: 'Info',
                    padding: const EdgeInsets.only(top: 2.0),
                    highlightColor: const Color.fromARGB(50, 0, 0, 0),
                    onPressed: () {
                      _showMyDialog(context, index);
                    },
                  ),
                  Center(
                    child: Text(
                      taskTitleArray[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit',
                    highlightColor: const Color.fromARGB(50, 0, 0, 0),
                    onPressed: () async {
                      final editResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTask(
                            taskTitle: taskTitleArray[index],
                            details: taskDetailArray[index],
                            buttonLabel: "Update",
                          )
                        ),
                      );
                      if (editResult != null && editResult is TextData) {
                        setState(() {
                          taskTitleArray[index] = editResult.textField1Value;
                          taskDetailArray[index] = editResult.textField2Value;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete',
                    highlightColor: const Color.fromARGB(50, 0, 0, 0),
                    onPressed: () {
                      setState(() {
                        taskTitleArray.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        // ],
        }
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        backgroundColor: const Color(0xFF9395D3),
        onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTask()),
            );
            if (result != null) {
              setState(() {
                taskTitleArray.add(result.textField1Value);
                taskDetailArray.add(result.textField2Value);
              });
            }
          },
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.inventory_rounded),
      //       label: 'Completed',
      //     ),
          
      //   ],
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
