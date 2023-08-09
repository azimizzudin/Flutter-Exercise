import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/chat_message_entity.dart';
import 'package:flutter_exercise/widgets/picker_body.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  const ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final messageController = TextEditingController();

  void onSendButtonPressed() {
    debugPrint('Chat Message: ${messageController.text}');

    final newChatMessage = ChatMessageEntity(
        text: messageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: 'poojab26'));

    if (_selectedImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);

    setState(() {
      messageController.clear();
      _selectedImageUrl = '';
    });
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return NetworkImagePickerBody(
                          onImageSelected: onImagePicked);
                    });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(color: Colors.white),
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              if (_selectedImageUrl.isNotEmpty)
                Image.network(_selectedImageUrl, height: 50),
            ],
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
