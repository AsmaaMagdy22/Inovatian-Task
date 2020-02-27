import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Archiver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  void _archive() {
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(Directory (myController.text)  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Container(
        child: TextField(
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter path folder'),
        ),width: MediaQuery.of(context).size.width * 0.5,

        ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: _archive,

              child: const Text(
                  'Archive',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ],
        ),
      ),

    );
  }
}
