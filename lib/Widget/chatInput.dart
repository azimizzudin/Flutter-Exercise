import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key}) : super(key: key);

  final messageController = TextEditingController();

  void onSendButtonPressed() {
    print('Chat Message: ${messageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.black,
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
                hintStyle: TextStyle(color: Colors.white54)),
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
