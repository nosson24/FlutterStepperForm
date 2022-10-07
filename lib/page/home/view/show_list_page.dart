import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/model/todo_model.dart';
import 'package:flutter_to_do_list/page/add_task/view/add_task_page.dart';
import 'package:flutter_to_do_list/page/show_list/view/list_all_data_page.dart';
import 'package:flutter_to_do_list/service/todo_list_service.dart';
import 'package:flutter_to_do_list/style/text_style.dart';

class ShowListPage extends StatefulWidget {
  const ShowListPage({super.key});

  @override
  State<ShowListPage> createState() => _ShowListPageState();
}

class _ShowListPageState extends State<ShowListPage> {
  List<ToDoModel> toDoList = ToDoListService.getToDoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTaskPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (_, int index) {
                return Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 85,
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListAllDataPage(
                                          todo: toDoList[index],
                                        )));
                          },
                          title: Text(
                            toDoList[index].firstName ?? '-',
                            style: MainFontstyle.titleText,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          ToDoListService.reMoveToDo(toDoList[index]);
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          width: 86,
                          height: 85,
                          decoration:
                              const BoxDecoration(color: Colors.lightBlue),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
