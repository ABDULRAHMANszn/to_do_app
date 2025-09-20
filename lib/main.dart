import 'package:flutter/material.dart';
import 'package:to_do_app/todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Todolist(),
    );
  }
}

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class task {
  String titel;
  bool stu;
  task({required this.titel, required this.stu});
}

class _TodolistState extends State<Todolist> {
  final mycontroller = TextEditingController();
  String mytask = "";

  List tasks = [
    task(titel: "mytask", stu: false),
    task(titel: "222222222", stu: true),
    task(titel: "3333333333", stu: false),
  ];
  void addtask() {
    setState(() {
      tasks.add(task(titel: mycontroller.text, stu: false));
      mycontroller.clear();
    });
  }

  int count() {
    int completedtasks = 0;
    for (var item in tasks) {
      if (item.stu) {
        completedtasks++;
      }
    }
    return completedtasks;
  }

  void deleteindex(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void deleteall() {
    setState(() {
      tasks.removeRange(0, tasks.length);
    });
  }

  void changestu(int index) {
    setState(() {
      tasks[index].stu = !tasks[index].stu;
    });
  }

  bool check() {
    return count() == tasks.length;
  }
  bool doornot(int index) {
    return tasks[index].stu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              deleteall();
            },
            icon: Icon(
              Icons.delete_forever,
              color: const Color.fromARGB(255, 227, 148, 148),
              size: 35,
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "To Do App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "${count()}/${tasks.length}",
                style: TextStyle(
                  fontSize: 44,
                  color: check() ? Colors.green : Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),

              height: 550,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return cards(
                    titel: tasks[index].titel,
                    stu: tasks[index].stu,
                    changestu: changestu,
                    index: index,
                    delete: deleteindex,
                    doneORnot: doornot,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showModalBottomSheet
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(22),
                ),
                child: Container(
                  padding: EdgeInsets.all(22),

                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mycontroller,
                        maxLength: 20,
                        autofocus: true,

                        //decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 22),
                      TextButton(
                        onPressed: () {
                          addtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "add",
                          style: TextStyle(fontSize: 25, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            // isScrollControlled: true,
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
