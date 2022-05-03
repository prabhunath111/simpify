import 'package:flutter/material.dart';
import 'package:simpify_demo_assignment/widgets/my_text.dart';

class UserRow extends StatelessWidget {
  final String header;
  final String description;

  const UserRow({Key? key, required this.header, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          MyText(
            text: header,
          ),
          MyText(text: description),
        ],
      ),
    );
  }
}
