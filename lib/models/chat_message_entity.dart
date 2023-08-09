class ChatMessageEntity {
  String id;
  String text;
  String? imageUrl;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      required this.id,
      this.imageUrl,
      required this.createdAt,
      required this.author});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        id: json['id'],
        imageUrl: json['image'],
        createdAt: json['createdAt'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username']);
  }
}
