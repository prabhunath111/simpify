import 'dart:convert';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/constants/app_api.dart';
import 'package:simpify_demo_assignment/controller/base_controller.dart';
import 'package:simpify_demo_assignment/models/comments_model.dart';
import 'package:simpify_demo_assignment/models/posts_model.dart';
import 'package:simpify_demo_assignment/screens/posts_screen/posts_screen.dart';
import 'package:simpify_demo_assignment/services/base_client.dart';
import 'package:simpify_demo_assignment/widgets/custom_dialog.dart';

class PostsController extends GetxController with BaseController {

  final List<PostsModel> _postsList = <PostsModel>[];
  final List<CommentsModal> _commentList = <CommentsModal>[];

  List<PostsModel> get getPostsList => _postsList;
  List<CommentsModal> get getCommentsList => _commentList;

  Future<void> getPostsFromApi(String id) async {
    _postsList.clear();
    CustomDialog.showLoading();
    final response = await BaseClient().get(baseUrl, getPostsApi+'?userId=$id').catchError(handleError);
    CustomDialog.hideLoading();
    if(response != null){
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _postsList.add(PostsModel.fromJson(body[i]));
      }
      Get.to(const PostsScreen());
    }
    update();
  }

  Future<void> getCommentsOfPost(String id) async {
    _commentList.clear();
    CustomDialog.showLoading();
    final response = await BaseClient().get(baseUrl, getPostsApi+"/$id/$getCommentsApi").catchError(handleError);
    CustomDialog.hideLoading();
    if(response != null) {
      final body = jsonDecode(response);
      for(int i = 0; i < body.length; i++) {
        _commentList.add(CommentsModal.fromJson(body[i]));
        if(i==2){
          break;
        }
      }
    }
    update();
  }
}