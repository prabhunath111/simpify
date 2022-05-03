import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/albums_controller/albums_controller.dart';
import 'package:simpify_demo_assignment/controller/posts_controller/posts_controller.dart';
import 'package:simpify_demo_assignment/controller/to_do_controller/to_do_controller.dart';
import 'package:simpify_demo_assignment/controller/users_controller/users_controller.dart';
import 'package:simpify_demo_assignment/screens/home_screen/widgets/user_row.dart';
import 'package:simpify_demo_assignment/screens/posts_screen/posts_screen.dart';
import 'package:simpify_demo_assignment/screens/todo_screen/to_do_screen.dart';
import 'package:simpify_demo_assignment/widgets/loading.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

import '../albums_screen/albums_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UsersController usersController = Get.put(UsersController());

  @override
  void initState() {
    // TODO: implement initState
    getUsersFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const MyText(
            text: "Users",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<UsersController>(
            builder: (logic) {
              return (logic.getUsersModalList.isEmpty)
                  ? const Loading()
                  : ListView.builder(
                      itemCount: logic.getUsersModalList.length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                UserRow(header: "Name: ", description: logic.getUsersModalList[index].name.toString()),
                                UserRow(header: "Email: ", description: logic.getUsersModalList[index].email.toString()),
                                UserRow(header: "Address: ", description: logic.getUsersModalList[index].address!.street.toString()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(onPressed: () async {
                                      final PostsController postsController = Get.put(PostsController());
                                      await postsController.getPostsFromApi(logic.getUsersModalList[index].id.toString());
                                      Get.to(const PostsScreen());
                                    }, child: const MyText(text: "Posts",)),
                                    ElevatedButton(onPressed: () async {
                                      final AlbumsController albumsController = Get.put(AlbumsController());
                                      await albumsController.getAlbumsFromApi(logic.getUsersModalList[index].id.toString());
                                      Get.to(const AlbumsScreen());
                                    }, child: const MyText(text: "Albums",)),
                                    ElevatedButton(onPressed: () async {
                                      final ToDoController toDosController = Get.put(ToDoController());
                                      await toDosController.getToDos(logic.getUsersModalList[index].id.toString());
                                      Get.to(const ToDoScreen());
                                    }, child: const MyText(text: "To-Do",))
                                  ],
                                )
                              ],
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

  Future<void> getUsersFromApi() async {
    await usersController.getUsersList();
  }
}
