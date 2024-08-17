import 'package:flutter/material.dart';
import 'screens/todo_app_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9395D3)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Todo App'),
      home: TodoApp(), // used todo_app_main.dart file to render initially
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const AddTask()),
      //       );
      _counter++;
    });
  }

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
            tooltip: 'Open shopping cart',
            onPressed: () {
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddTask()),
            // );
          },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
