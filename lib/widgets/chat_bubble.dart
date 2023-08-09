import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.username == 'poojab26';
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isAuthor ? Theme.of(context).primaryColor : Colors.black87,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageUrl != null)
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(entity.imageUrl!)),
                      borderRadius: BorderRadius.circular(12))),
          ],
        ),
      ),
    );
  }
}
