import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  @override
  String toString() =>
      'id:$id,email:$author,firstName:$width,lastName:$height,description:$url,avatar:$downloadUrl';
  User({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        author: json['author'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        downloadUrl: json['download_url'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'author': author,
        'width': width,
        'height': height,
        'url': url,
        'download_url': downloadUrl,
      };
}
