import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/bloc/bloc_list_data_manu.dart';
import 'package:flutter_to_do_list/model/todo_model.dart';
import 'package:flutter_to_do_list/page/home/view/show_list_page.dart';
import 'package:flutter_to_do_list/service/todo_list_service.dart';
import 'package:flutter_to_do_list/style/text_style.dart';

class ListAllDataPage extends StatelessWidget {
  final ToDoModel todo;
  const ListAllDataPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 85,
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: ListTile(
                    title: Text(
                      todo.firstName ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    ToDoListService.reMoveToDo(todo);
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ShowListPage()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 86,
                    height: 85,
                    decoration: const BoxDecoration(color: Colors.lightBlue),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo,
                  border: Border.all(width: 2, color: Colors.black87)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocDataManu(
                    titleText: const Text(
                      "First Name :",
                      style: MainFontstyle.mainFont2,
                    ),
                    subText: Text(
                      todo.firstName ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                  BlocDataManu(
                    titleText: const Text(
                      "Last Name :",
                      style: MainFontstyle.mainFont2,
                    ),
                    subText: Text(
                      todo.lastName ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                  BlocDataManu(
                    titleText: const Text(
                      "Age :",
                      style: MainFontstyle.mainFont2,
                    ),
                    subText: Text(
                      todo.age ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                  BlocDataManu(
                    titleText: const Text(
                      "Phone Number :",
                      style: MainFontstyle.mainFont2,
                    ),
                    subText: Text(
                      todo.phoneNumber ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                  BlocDataManu(
                    titleText: const Text(
                      "Email :",
                      style: MainFontstyle.mainFont2,
                    ),
                    subText: Text(
                      todo.email ?? '-',
                      style: MainFontstyle.titleText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
