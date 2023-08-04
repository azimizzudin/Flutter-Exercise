import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/chatMessageEntity.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final messageController = TextEditingController();

  void onSendButtonPressed() {
    print('Chat Message: ${messageController.text}');

    final newChatMessage = ChatMessageEntity(
        text: messageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: 'poojab26'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          Expanded(
              child: TextField(
            controller: messageController,
            keyboardType: TextInputType.multiline,
            style: TextStyle(color: Colors.white),
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.white)),
          )),
          IconButton(
              onPressed: () {
                onSendButtonPressed();
              },
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
