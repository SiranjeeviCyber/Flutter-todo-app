import 'package:flutter/material.dart';
import 'todo_app_main.dart';

class AddTask extends StatefulWidget {
  final String? taskTitle;
  final String? details;
  final String? buttonLabel;
  const AddTask({this.taskTitle,this.details, this.buttonLabel, super.key});

  @override
  State<AddTask> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTask> {
  late TextEditingController myController = TextEditingController();
  late TextEditingController myController1 = TextEditingController();
  TextData? _textData;
  final formValidationKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    myController = TextEditingController(text : widget.taskTitle);
    myController1 = TextEditingController(text : widget.details);
  }

  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                // MaterialPageRoute(builder: (context) => const TodoApp()),
              );
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Task"),
      ),
      body: Form(
        key: formValidationKey,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'ABC Client meeting',
                    hintStyle: TextStyle( // Custom style for the hint text
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  maxLength: 25,
                  controller: myController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Details',
                    hintText: 'Client meeting to discuss the requirements',
                    hintStyle: TextStyle( // Custom style for the hint text
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  maxLength: 100,
                  controller: myController1,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (formValidationKey.currentState!.validate()) {
                        _textData = TextData(myController.text, myController1.text);
                        Navigator.pop(context, _textData);
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: const Color(0xFF9395D3), // Background color
                      overlayColor: Colors.white,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(widget.buttonLabel ?? "Add"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class TextData {
  final String textField1Value;
  final String textField2Value;

  TextData(this.textField1Value, this.textField2Value);
}
