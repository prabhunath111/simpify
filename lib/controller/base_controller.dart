import 'package:get/get.dart';
import 'package:simpify_demo_assignment/services/app_exceptions.dart';
import 'package:simpify_demo_assignment/widgets/error_bottom_sheet.dart';

class BaseController {
  Future<void> handleError(error) async {
    if (error is BadRequestException) {
      showError(error.message);
    } else if (error is FetchDataException) {
      showError(error.message);
    } else if (error is ApiNotRespondingException) {
      showError(error.message);
    }else if(error is UnAuthorizedException) {
      showError(error.message);
    }else {

    }
  }
  showError(String? msg) {
    if(Get.isBottomSheetOpen != null && Get.isBottomSheetOpen!){
      Get.back();
    }
    if(Get.isDialogOpen != null && Get.isDialogOpen!){
      Get.back();
    }
    Get.bottomSheet(ErrorBottomSheet(msg: msg??"Something Went Wrong!"));
  }
}
