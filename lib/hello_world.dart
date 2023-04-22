
import 'package:flutter/material.dart';

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../assets/images/world.jpg',width: 200,height: 200,),
            const SizedBox(height: 20),
            const Text("Hello World, which is as you can see is ROUND, not FLAT!")
          ],
        ),
      ),
    );
  }
}