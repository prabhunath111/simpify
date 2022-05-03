import 'dart:convert';

AlbumsModel albumsModalModalFromJson(String str) => AlbumsModel.fromJson(json.decode(str));

class AlbumsModel {
  AlbumsModel({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );
}
