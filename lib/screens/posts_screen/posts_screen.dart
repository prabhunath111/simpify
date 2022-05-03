import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/posts_controller/posts_controller.dart';
import 'package:simpify_demo_assignment/themes/colors.dart';
import 'package:simpify_demo_assignment/widgets/loading.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostsController postsController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const MyText(
            text: "Posts",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<PostsController>(
            builder: (logic) {
              return (logic.getPostsList.isEmpty)
                  ? const Loading()
                  : ListView.builder(
                      itemCount: logic.getPostsList.length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpansionTile(
                              title: MyText(
                                text: logic.getPostsList[index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  fontSize: 18.0
                                ),
                              ),
                              subtitle: MyText(
                                text: logic.getPostsList[index].body.toString(),
                              ),
                              children: (logic.getCommentsList.isEmpty)?[]:List.generate(4, (commentIndex) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: (commentIndex == 0)?const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.comment_outlined, color: purpleMaterial)):Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                child: Icon(Icons.person),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: MyText(text: logic.getCommentsList[commentIndex-1].name.toString(),
                                                style: const TextStyle(fontWeight: FontWeight.w800),),
                                              ),
                                            ],
                                          ),
                                        ),
                                        MyText(text: logic.getCommentsList[commentIndex-1].body.toString()),
                                    ],
                                  ),
                                      ),
                                );
                              }),
                              onExpansionChanged: (value) async {
                                if(value){
                                  await postsController.getCommentsOfPost(logic.getPostsList[index].id.toString());
                                }
                              },
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
