import 'dart:convert';

CommentsModal commentsModalFromJson(String str) => CommentsModal.fromJson(json.decode(str));

class CommentsModal {
  CommentsModal({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory CommentsModal.fromJson(Map<String, dynamic> json) => CommentsModal(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

}
