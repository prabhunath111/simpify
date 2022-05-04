import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/albums_controller/albums_controller.dart';
import 'package:simpify_demo_assignment/controller/posts_controller/posts_controller.dart';
import 'package:simpify_demo_assignment/controller/to_do_controller/to_do_controller.dart';
import 'package:simpify_demo_assignment/controller/users_controller/users_controller.dart';
import 'package:simpify_demo_assignment/screens/home_screen/widgets/user_row.dart';
import 'package:simpify_demo_assignment/widgets/loading.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

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
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final PostsController postsController = Get.put(PostsController());
                                        await postsController.getPostsFromApi(logic.getUsersModalList[index].id.toString());
                                      },
                                      child: _buttonsColumn("Posts",Icons.local_post_office_outlined),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final AlbumsController albumsController = Get.put(AlbumsController());
                                        await albumsController.getAlbumsFromApi(logic.getUsersModalList[index].id.toString());
                                      },
                                      child: _buttonsColumn("Albums", Icons.photo_album_sharp),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final ToDoController toDosController = Get.put(ToDoController());
                                        await toDosController.getToDos(logic.getUsersModalList[index].id.toString());
                                      },
                                      child: _buttonsColumn("To-Do", Icons.today_outlined)
                                    ),
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

  Widget _buttonsColumn(String string, IconData? icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.purple),
        MyText(text: string),
      ],
    );
  }
}
