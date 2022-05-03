import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

class ErrorBottomSheet extends StatelessWidget {
  final String msg;
  const ErrorBottomSheet({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(bottom: 8, right: 20, left: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.02),
          Center(
            child: Container(
              height: 6.0,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          const MyText(
            text: "Error",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(height: Get.height * 0.02),
          MyText(
            text: msg,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
