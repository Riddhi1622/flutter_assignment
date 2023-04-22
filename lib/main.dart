import 'package:flutter/material.dart';
import 'hello_world.dart';
import 'calculator.dart';
import 'notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/hello_world': (context) => const HelloWorldPage(),
        '/calculator': (context) => const Calculator(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assignment'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Select Any One:'
                ,style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hello_world');
              },
              child:const Text('Hello World',style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculator');
              },
              child:const Text('Calculator',style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notes');
              },
              child:const Text('Making Notes',style: TextStyle(fontSize: 20)),
    ),
          ],
        )
        ),
      ),
    );
  }
}