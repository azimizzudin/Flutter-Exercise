import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Let\'s sign you in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            const Text(
              'Welcome back! \n You\'ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.redAccent),
            ),
            Image.network(
              'https://th.bing.com/th/id/R.999d85e6fdf0fde1b14688ea421e9ece?rik=kBsOAaHl%2bjEy5g&riu=http%3a%2f%2fimg1.wikia.nocookie.net%2f__cb20141129091239%2fmegamitensei%2fimages%2f4%2f40%2fPersona_3_portable_fanbook.jpg&ehk=rL%2fctwzTati0A2C%2fawUMxd%2fxIO67fUfO2trBu2BlIsw%3d&risl=&pid=ImgRaw&r=0',
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
