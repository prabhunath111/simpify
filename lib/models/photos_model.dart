import 'dart:convert';

PhotosModal photosModalFromJson(String str) => PhotosModal.fromJson(json.decode(str));

class PhotosModal {
  PhotosModal({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory PhotosModal.fromJson(Map<String, dynamic> json) => PhotosModal(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );
}
