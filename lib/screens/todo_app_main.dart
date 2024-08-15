import 'package:flutter/material.dart';
import 'add_task.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  // final myController = TextEditingController();
  String ? taskTitle;
  List<String> taskTitleArray = [];
  List<String> taskDetailArray = [];

  Future<void> _showMyDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss the dialog.
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(taskDetailArray[index]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                // Perform some action if needed
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Builder(
        //   builder: (BuildContext context){
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () { Scaffold.of(context).openDrawer(); },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   }
        // ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_sharp),
            tooltip: 'Calender view',
            onPressed: () {
            },
          ),
        ],
        elevation: 20,
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
                color: const Color(0xFF9395D3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                    tooltip: 'Edit',
                    padding: EdgeInsets.only(top: 2.0),
                    highlightColor: Color.fromARGB(50, 0, 0, 0),
                    onPressed: () {
                      _showMyDialog(context, index);
                    },
                  ),
                  Center(
                    child: Text(
                      taskTitleArray[index],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit',
                    highlightColor: Colors.white,
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete',
                    highlightColor: Colors.white,
                    onPressed: () {
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
        // onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
