import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/to_do_controller/to_do_controller.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

import '../../widgets/loading.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoController toDoController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const MyText(
            text: "To Do",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<ToDoController>(
            builder: (logic) {
              return (logic.getToDoList.isEmpty)?const Loading():ListView.builder(
                itemCount: logic.getToDoList.length,
                  itemBuilder: (_, index) {
                return Card(
                  elevation: 4.0,
                  color: (logic.getToDoList[index].completed!)?Colors.green:Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText(
                      text: logic.getToDoList[index].title.toString(),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
