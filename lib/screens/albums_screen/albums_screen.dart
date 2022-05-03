import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/controller/albums_controller/albums_controller.dart';
import 'package:simpify_demo_assignment/screens/photos_screen/photos_screen.dart';
import 'package:simpify_demo_assignment/widgets/loading.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlbumsController albumsController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const MyText(
            text: "Albums",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<AlbumsController>(
            builder: (logic) {
              return (logic.getAlbumList.isEmpty)
                  ? const Loading()
                  : ListView(
                children: [
                GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: const ScrollPhysics(),
                children: List.generate(logic.getAlbumList.length, (index) {
                  return InkWell(
                    onTap: () async {
                      await logic.getPhotosOfAlbum(logic.getAlbumList[index].id.toString());
                      Get.to(PhotosScreen(title: logic.getAlbumList[index].title));
                    },
                    child: Card(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyText(
                            text: logic.getAlbumList[index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
