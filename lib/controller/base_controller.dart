import 'dart:convert';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/services/app_exceptions.dart';

class BaseController {
  Future<void> handleError(error) async {
    if (error is BadRequestException) {
      //show dialog
/*    print("line8 ${error.message}");
      var message = error.message;
      CustomDialog.showErrorDialog(
      description: message,
      );*/
    } else if (error is FetchDataException) {
      if(Get.isBottomSheetOpen != null && Get.isBottomSheetOpen!){
        Get.back();
      }
      if(Get.isDialogOpen != null && Get.isDialogOpen!){
        Get.back();
      }
      // Get.bottomSheet(ErrorBottomSheet(msg: error.message??"No Internet connection"));
    } else if (error is ApiNotRespondingException) {
      /* print("line21 ${error.message}");
      CustomDialog.showErrorDialog(
        description: 'Oops! It took longer to respond',
      );*/
    }else if(error is UnAuthorizedException) {
      // final LoginController _loginController = Get.put(LoginController());
      // final body = jsonDecode(error.message.toString());
      // if(body['errors'] == "Refresh token is expired.") {
      //   _loginController.verifyToken(isRefreshTokenExp: true);
      // }else if(body['errors'] == 'Invalid Token.'){
      //   _loginController.verifyToken(isRefreshTokenExp: true);
      // }
      // else{
      //   _loginController.verifyToken();
      // }
    }else {

    }
  }
}
