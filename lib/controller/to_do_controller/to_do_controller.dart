import 'dart:convert';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/constants/app_api.dart';
import 'package:simpify_demo_assignment/controller/base_controller.dart';
import 'package:simpify_demo_assignment/models/to_do_model.dart';
import 'package:simpify_demo_assignment/screens/todo_screen/to_do_screen.dart';
import 'package:simpify_demo_assignment/services/base_client.dart';
import 'package:simpify_demo_assignment/widgets/custom_dialog.dart';

class ToDoController extends GetxController with BaseController {

  final List<ToDosModel> _toDoList = <ToDosModel>[];

  List<ToDosModel> get getToDoList => _toDoList;

  Future<void> getToDos(String id) async {
    _toDoList.clear();
    CustomDialog.showLoading();
    final response = await BaseClient().get(baseUrl, "users/$id/"+getToDosApi).catchError(handleError);
    CustomDialog.hideLoading();
    if(response != null) {
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _toDoList.add(ToDosModel.fromJson(body[i]));
      }
      Get.to(const ToDoScreen());
    }
    update();
  }
}