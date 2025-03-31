import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 static const platform = MethodChannel('com.example/homeView');

  Future<void> _openHomeView() async {
    try {
      final String result = await platform.invokeMethod('openHomeView');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to open Home View: '${e.message}'.");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Title Hello"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _openHomeView();
                },
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.all(10),
                  child: Text("Push to Swift screen"),
                ),
              ),
            ),
            TextField()
          ],
        ),
      ),
    );
  }
}
