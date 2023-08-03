import 'package:flutter/material.dart';
import 'package:flutter_exercise/Widget/chatBubble.dart';
import 'package:flutter_exercise/Widget/chatInput.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $username!'),
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.maybePop(context);
                print('Sign out!');
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: 'Hallo');
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
