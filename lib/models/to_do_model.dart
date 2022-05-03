import 'dart:convert';

ToDosModel toDosModalFromJson(String str) => ToDosModel.fromJson(json.decode(str));

class ToDosModel {
  ToDosModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory ToDosModel.fromJson(Map<String, dynamic> json) => ToDosModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

}
