import 'dart:convert';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/constants/app_api.dart';
import 'package:simpify_demo_assignment/controller/base_controller.dart';
import 'package:simpify_demo_assignment/models/users_model.dart';
import 'package:simpify_demo_assignment/services/base_client.dart';

class UsersController extends GetxController with BaseController {

  final List<UsersModel> _usersModalList = <UsersModel>[];
  List<UsersModel> get getUsersModalList => _usersModalList;

  Future<void> getUsersList() async {
    final response = await BaseClient().get(baseUrl, getUsersApi).catchError(handleError);
    if(response != null){
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _usersModalList.add(UsersModel.fromJson(body[i]));
      }
    }
    update();
  }
}