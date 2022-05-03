import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/albums_controller/albums_controller.dart';
import 'package:simpify_demo_assignment/widgets/loading.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

class PhotosScreen extends StatelessWidget {
  final String? title;

  const PhotosScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlbumsController albumsController = Get.find();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: MyText(
              text: title ?? "Photos",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GetBuilder<AlbumsController>(
              builder: (logic) {
                return (logic.getPhotosList.isEmpty)?const Loading():ListView(
                  children: List.generate(logic.getPhotosList.length, (index) {
                    return Card(
                      child: Image.network(logic.getPhotosList[index].url.toString()),
                    );
                  }),
                );
              },
            ),
          ),
      ),
    );
  }
}
