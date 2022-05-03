import 'dart:convert';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/constants/app_api.dart';
import 'package:simpify_demo_assignment/controller/base_controller.dart';
import 'package:simpify_demo_assignment/models/albums_model.dart';
import 'package:simpify_demo_assignment/models/photos_model.dart';
import 'package:simpify_demo_assignment/screens/albums_screen/albums_screen.dart';
import 'package:simpify_demo_assignment/screens/photos_screen/photos_screen.dart';
import 'package:simpify_demo_assignment/widgets/custom_dialog.dart';
import '../../services/base_client.dart';

class AlbumsController extends GetxController with BaseController {

  final List<AlbumsModel> _albumsList = <AlbumsModel>[];
  final List<PhotosModal> _photosList = <PhotosModal>[];

  List<AlbumsModel> get getAlbumList => _albumsList;
  List<PhotosModal> get getPhotosList => _photosList;

  Future<void> getAlbumsFromApi(String userId) async {
    _albumsList.clear();
    CustomDialog.showLoading();
    final response = await BaseClient().get(baseUrl, getAlbumsApi+"?userId=$userId").catchError(handleError);
    CustomDialog.hideLoading();
    if(response != null) {
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _albumsList.add(AlbumsModel.fromJson(body[i]));
      }
      Get.to(const AlbumsScreen());
    }
    update();
  }

  Future<void> getPhotosOfAlbum(String id, String? title) async {
    _photosList.clear();
    CustomDialog.showLoading();
    final response = await BaseClient().get(baseUrl, getPhotosApi+"?albumId=$id").catchError(handleError);
    CustomDialog.hideLoading();
    if(response != null){
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _photosList.add(PhotosModal.fromJson(body[i]));
      }
      Get.to(PhotosScreen(title: title));
    }
    update();
  }
}