import 'package:flutter/material.dart';
import 'package:flutter_exercise/Widget/chatBubble.dart';
import 'package:flutter_exercise/Widget/chatInput.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Azim!'),
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print('logout');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(
                    alignment: Alignment.centerLeft,
                    message: 'Hello, this is Azim'),
                ChatBubble(alignment: Alignment.centerRight, message: 'Hi'),
                ChatBubble(alignment: Alignment.centerLeft, message: 'Fuck U'),
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
