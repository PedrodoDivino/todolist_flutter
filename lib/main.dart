import 'package:flutter/material.dart';

void main() => runApp(Myapp());

// ignore: use_key_in_widget_constructors
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do-List',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu To-Do list'),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        child: Column(
          children: [
            Container(
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'O campo não pode ser vazio';
                          }
                          return null;
                        },
                        controller: taskController,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Digite uma task aqui... ',
                            hintStyle: TextStyle(
                              fontSize: 20,
                            )),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            setState(() {
                                _tasks.add(taskController.text);
                            });

 
                              taskController.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 3, 93, 129),
                          ),
                          child: Text(
                            'Adicionar',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, item) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[item]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
