import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Azim!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print('logout');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hi, this is your message!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.network(
                      height: 200,
                      'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0')
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hi, this is your message!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.network(
                      height: 200,
                      'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0')
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hi, this is your message!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.network(
                      height: 200,
                      'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0')
                ],
              ),
            ),
          ),
          Container(
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
