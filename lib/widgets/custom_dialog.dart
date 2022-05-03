import 'package:get/get.dart';
import 'loading.dart';
class CustomDialog {
  static dynamic hideLoading() {
    if (Get.isDialogOpen == true) {
      Get.back();
    } else {}
  }
  static dynamic showLoading() {
    Get.dialog(const Loading(), barrierDismissible: false);
  }
}
