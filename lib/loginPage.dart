import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Button clicked'),
      ),
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
                fontSize: 30,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Text(
            'Welcome back! \n You\'ve been missed!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.redAccent),
          ),
          Image.network(
            'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0',
            height: 200,
          ),
          Container(
            height: 150,
            width: 150,
            // child: FlutterLogo(),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0')),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24)),
          )
        ],
      ),
    );
  }
}
